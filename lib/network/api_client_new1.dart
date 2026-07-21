import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:http/http.dart' as http;

import '../core/flavours/constants.dart';
import '../others/data_encryption.dart';
import '../others/network_constant.dart';
import '../ui_one/custom_widgets/session_vpn.dart';
import './api_connectivity.dart';
import './api_dio_clients.dart';
import './api_error_handlers.dart';
import './api_helpers.dart';
import './api_token_manager.dart';
import './api_ui_handlers.dart';

/// True when the app is NOT in production (covers non-prod release builds too).
bool get _isNonProd => AppConfigs.env != Environment.prod || kDebugMode;

class ApiClient {
  static final ApiClient _i = ApiClient._();

  factory ApiClient() => _i;

  Dio admin = Dio();
  Dio user = Dio();
  Dio formRules = Dio();
  Dio uaePass = Dio();
  Dio dioIpAddress = Dio();

  static CancelToken cancelToken = CancelToken();

  static String? get customerCode => Box3.customerDetailsFZ?.data?.customerCode;

  static String? get sessionId => Box3.customerDetailsFZ?.data?.appSession;

  static String? get customerName =>
      "${Box3.customerDetailsFZ?.data?.personalInfo?.name1} ${Box3.customerDetailsFZ?.data?.personalInfo?.name2} ${Box3.customerDetailsFZ?.data?.personalInfo?.name3}";
  static String deviceId = Box3.deviceId ?? '';

  String get deviceType => Platform.isAndroid ? 'android' : 'ios';

  ApiClient._() {
    _initializeClients();
  }

  void _initializeClients() {
    admin = DioClients.createAdminClient(AppConfigs.userUrl);
    user = DioClients.createUserClient(AppConfigs.userUrl);
    formRules = DioClients.createFormRulesClient(AppConfigs.userUrl);
    uaePass = DioClients.createUaePassClient(AppConfigs.uaePass);

    _addErrorInterceptors();
  }

  void _addErrorInterceptors() {
    admin.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          await ApiConnectivity.handleConnectivityError(e, handler, admin);
        },
      ),
    );

    user.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          await ApiConnectivity.handleConnectivityError(e, handler, user);
        },
      ),
    );

    formRules.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          await ApiConnectivity.handleConnectivityError(e, handler, formRules);
        },
      ),
    );

    uaePass.interceptors.add(
      InterceptorsWrapper(
        onError: (DioException e, ErrorInterceptorHandler handler) async {
          await ApiConnectivity.handleConnectivityError(e, handler, uaePass);
        },
      ),
    );
  }

  Future<Response?> post({
    required String path,
    Map<String, dynamic>? data,
    bool exclude = false,
    FormData? formData,
    int retryCount = 0,
  }) async {
    if (!Box3.isVpn) {
      try {
        final dioClient = ApiHelpers.getDioClientForPath(path);
        final response = await dioClient.request(
          path,
          data: ApiHelpers.shouldUseFormData(path) ? data : formData ?? data,
          options: Options(
            method: 'POST',
            responseType: ResponseType.json,
            sendTimeout: const Duration(seconds: 90),
            receiveTimeout: const Duration(seconds: 90),
          ),
        );
        if (ApiTokenManager.isTokenExpired(response.data)) {
          if (retryCount < 1) {
            final result = await ApiTokenManager.retryWithNewToken(() async {
              // Get the fresh token after regeneration
              final newToken = Box3.appKeyToken;

              // Update the token in the data map (handle both casings and MainToken)
              if (data != null) {
                bool updated = false;
                if (data.containsKey('Token')) {
                  data['Token'] = newToken;
                  updated = true;
                }
                if (data.containsKey('token')) {
                  data['token'] = newToken;
                  updated = true;
                }
                if (data.containsKey('MainToken')) {
                  data['MainToken'] = newToken;
                  updated = true;
                }
                // If neither key existed, default to 'Token' for the retry
                if (!updated) {
                  data['Token'] = newToken;
                }
              }

              // CRITICAL: Also update the token in FormData if it's being used
              if (formData != null) {
                formData.fields.removeWhere((e) =>
                    e.key == 'Token' || e.key == 'token' || e.key == 'MainToken');
                formData.fields.add(MapEntry('Token', newToken ?? ''));
              }

              // Retry the API call one more time
              return await post(
                path: path,
                data: data,
                formData: formData,
                exclude: exclude,
                retryCount: retryCount + 1,
              );
            });
            return ApiHelpers.handleResponse(result, path);
          } else {
            // Retry failed. Show timeout dialog and route to login.
            await ApiTokenManager.handleSessionTimeout(path);
            return ApiHelpers.handleResponse(response, path);
          }
        }
        return ApiHelpers.handleResponse(response, path);
      } on DioException catch (e) {
        return await _handleDioException(e, path);
      }
    }
    return Response(
        requestOptions: RequestOptions(path: path),
        statusCode: 403,
        statusMessage: 'VPN detected',
        data: {
          'success': false,
          'message': 'VPN detected. Please disable VPN to continue.',
          'error': 'VPN_BLOCKED'
        });
  }

  Future<bool> postMediaNew(
    String path, {
    required Map<String, String> data,
    required File file,
    bool exclude = false,
    int retryCount = 0,
  }) async {
    try {
      var fullUrl = Uri.parse(AppConfigs.userUrl + path);
      final request = http.MultipartRequest('POST', fullUrl);
      request.fields.addAll(data);
      request.files.add(
          await http.MultipartFile.fromPath('Documents[0].DocFile', file.path));
      debugPrint('Path: $fullUrl');
      debugPrint('Path: ${request.fields}');
      final response = await request.send();
      final responseData = jsonDecode(await response.stream.bytesToString());

      if (response.statusCode == 200) {
        if (responseData['StatusCode'] == "RMA-SUCC") {
          return true;
        } else if (ApiTokenManager.isTokenExpired(responseData)) {
          if (retryCount < 1) {
            final result = await ApiTokenManager.retryWithNewToken(() async {
              final newToken = Box3.appKeyToken;

              if (data.containsKey('Token')) {
                data['Token'] = newToken ?? "";
              } else if (data.containsKey('token')) {
                data['token'] = newToken ?? "";
              } else if (data.containsKey('MainToken')) {
                data['MainToken'] = newToken ?? "";
              } else {
                data['Token'] = newToken ?? "";
              }

              return await postMediaNew(
                path,
                data: data,
                file: file,
                exclude: exclude,
                retryCount: retryCount + 1,
              );
            });
            return result ?? false;
          } else {
            await ApiTokenManager.handleSessionTimeout(path);
            return false;
          }
        } else {
          await ApiUIHandlers.showErrorAlert(responseData, path);
          return false;
        }
      }
      return false;
    } catch (e) {
      debugPrint('Error in postMediaNew: $e');
      return false;
    }
  }

  Future<Response?> postMedia(
    String path, {
    bool exclude = false,
    FormData? formData,
  }) async {
    try {
      final response = await user.request(
        path,
        data: formData,
        options: Options(
          method: 'POST',
          sendTimeout: const Duration(minutes: 5),
          receiveTimeout: const Duration(minutes: 5),
        ),
      );
      return response;
    } on DioException catch (e) {
      return await _handleMediaDioException(e, path);
    }
  }

  Future<Response?> postUAEPASS({
    Map<String, dynamic>? data,
    required Map<String, dynamic> header,
    required String url,
    required String method,
  }) async {
    try {
      final response = await uaePass.request(
        url,
        data: data != null ? FormData.fromMap(data) : null,
        options: Options(
          method: method,
          headers: header,
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 45),
          receiveTimeout: const Duration(seconds: 45),
        ),
      );
      return response;
    } on DioException catch (e) {
      debugPrint('UAE Pass API Error: ${e.message}');
      return null;
    }
  }

  Future<Response?> encryptedPost({
    required Map<String, dynamic> encData,
    required Map<String, dynamic>? data,
    required String path,
    bool exclude = false,
    FormData? formData,
  }) async {
    try {
      final myRes = await user.request(
        AppConfigs.userUrl + NetworkConstant.safeQuery,
        data: encData,
        options: Options(
          method: 'POST',
          responseType: ResponseType.json,
          sendTimeout: const Duration(seconds: 180),
          receiveTimeout: const Duration(seconds: 180),
        ),
      );

      if (myRes.data['StatusCode'] == "SCFG001") {
        final decryptApiResponse = DataEncryption.decryptDataPart(
            myRes.data['OutputBody']['RootNode']['data']);
        final res = Response(
          requestOptions: myRes.requestOptions,
          data: jsonDecode(decryptApiResponse),
        );

        return _handleEncryptedResponse(res, path, data, exclude, formData);
      }
    } on DioException catch (e) {
      return await _handleEncryptedDioException(e, path);
    }
    return null;
  }

  Future<Response> _handleDioException(DioException e, String path) async {
    print('\n=== CONNECTIVITY ERROR ===');
    print('Type: ${e.type}');
    print('Message: ${e.message}');
    print('Error: ${e.error}');
    print('URI: ${e.requestOptions.uri}');
    print('VPN Enabled: ${Box3.isVpn}');
    print('======================\n');

    final errorStr = e.error?.toString() ?? '';
    final isConnectionReset = errorStr.contains('Connection reset by peer');
    final isServerUnreachable = isConnectionReset ||
        e.type == DioExceptionType.connectionError ||
        errorStr.contains('SocketException');

    if (isServerUnreachable && !Box3.isVpn) {
      final isCriticalPath = path.contains('gettoken') ||
          path.contains('init') ||
          path.contains('config') ||
          path.contains('login');

      if (isCriticalPath) {
        await sessionVPN(
            title: 'Server Connection Error',
            message: 'Unable to connect to the server. This may be due to:\n\n'
                '• Server is temporarily down\n'
                '• Network connectivity issues\n'
                '• Server maintenance\n\n'
                'Please try again later or contact support.');
      }
    }

    return Response(
      requestOptions: e.requestOptions ?? RequestOptions(path: path),
      statusCode: e.response?.statusCode ?? 503,
      statusMessage: _getDioErrorMessage(e),
      data: {
        'success': false,
        'message': _getUserFriendlyErrorMessage(e),
        'error': _getErrorCode(e),
        'timestamp': DateTime.now().toIso8601String(),
      },
    );
  }

  String _getDioErrorMessage(DioException e) {
    if (e.error?.toString().contains('Connection reset by peer') == true) {
      return 'Connection reset by peer';
    }
    return e.message ?? 'Unknown Dio error';
  }

  String _getUserFriendlyErrorMessage(DioException e) {
    final errorStr = e.error?.toString() ?? '';

    if (errorStr.contains('Connection reset by peer')) {
      return 'Connection to server was lost. Please try again.';
    }
    if (errorStr.contains('SocketException') ||
        errorStr.contains('Failed host lookup')) {
      return 'Network connection error. Please check your internet.';
    }
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      return 'Request timeout. Please try again.';
    }
    if (e.type == DioExceptionType.connectionError) {
      return 'Cannot connect to server. Please check your network.';
    }

    final String genericError = 'Getting Unexpected Error. Please Retry.';
    if (_isNonProd) {
      final apiPath = e.requestOptions.path;
      final segments = apiPath.split('/').where((s) => s.isNotEmpty);
      final endpoint = segments.isNotEmpty ? segments.last : apiPath;
      return '$genericError\nAPI: $endpoint';
    }

    return genericError;
  }

  String _getErrorCode(DioException e) {
    if (e.error?.toString().contains('Connection reset by peer') == true) {
      return 'CONNECTION_RESET';
    }

    switch (e.type) {
      case DioExceptionType.connectionTimeout:
        return 'CONNECTION_TIMEOUT';
      case DioExceptionType.sendTimeout:
        return 'SEND_TIMEOUT';
      case DioExceptionType.receiveTimeout:
        return 'RECEIVE_TIMEOUT';
      case DioExceptionType.connectionError:
        return 'CONNECTION_ERROR';
      case DioExceptionType.badResponse:
        return 'BAD_RESPONSE';
      case DioExceptionType.cancel:
        return 'REQUEST_CANCELLED';
      case DioExceptionType.unknown:
        return 'UNKNOWN_ERROR';
      default:
        return 'NETWORK_ERROR';
    }
  }

  Future<Response?> _handleMediaDioException(
      DioException e, String path) async {
    if (Get.isDialogOpen != true) {
      final errorMessage = ApiErrorHandlers.extractErrorMessage(e);

      if (e.response?.data['Body']?['RootNode']?['SourceErrorDetails'] ==
          'Invalid Session ID') {
        await ApiTokenManager.handleSessionTimeout(path);
      } else {
        await ApiUIHandlers.showApiAlertDialog(
          'Error',
          _isNonProd ? '$errorMessage\n\n[API: $path]' : errorMessage,
          disableBack: true,
        );
      }
    }
    return null;
  }

  Future<void> _handleGenericError(
      DioException e, String path, String errorMessage) async {
    if (Get.isDialogOpen != true) {
      if (e.response?.data['Body']?['RootNode']?['SourceErrorDetails'] ==
          'Invalid Session ID') {
        await ApiTokenManager.handleSessionTimeout(path);
      } else {
        Map<String, dynamic> errorStringJson = {};
        try {
          String newEr = errorMessage.replaceAll("'", '"');
          errorStringJson = json.decode(newEr);
        } catch (_) {
          if (kDebugMode) {
            print(_.toString());
          }
        }

        if (errorStringJson["message"] != null) {
          final msg = errorStringJson["message"] ?? '';
          await ApiUIHandlers.showApiAlertDialog(
            'Error',
            _isNonProd ? '$msg\n\n[API: $path]' : msg,
            disableBack: true,
          );
        } else {
          await ApiUIHandlers.showApiAlertDialog(
            'Error',
            _isNonProd ? '$errorMessage\n\n[API: $path]' : errorMessage,
            disableBack: true,
          );
        }
      }
    }
  }

  Response? _handleEncryptedResponse(
    Response res,
    String path,
    Map<String, dynamic>? data,
    bool exclude,
    FormData? formData,
  ) {
    if (res.data['StatusCode'] == "ERRT001") {
      ApiUIHandlers.showApiAlertDialog(
        'Error',
        _isNonProd ? 'Route not found\n\n[API: $path]' : 'Route not found',
        disableBack: true,
      );
    } else if (ApiTokenManager.isTokenExpired(res.data)) {
      return res;
    } else if (res.data['StatusCode'] == "CC-INTSERVERERR") {
      final msg = res.data['StatusMessaage'] ?? "";
      ApiUIHandlers.showApiAlertDialog(
        "Error".tr,
        _isNonProd ? '$msg\n\n[API: $path]' : msg,
        disableBack: true,
      );
    }
    return res;
  }

  Future<Response?> _handleEncryptedDioException(
      DioException e, String path) async {
    if (e.type == DioExceptionType.receiveTimeout) {
      await ApiUIHandlers.showTimeoutAlert(path);
      return null;
    } else {
      await ApiUIHandlers.showApiAlertDialog(
        'Error',
        _isNonProd ? '${e.message}\n\n[API: $path]' : '${e.message}',
        disableBack: true,
      );
      return null;
    }
  }

  Dio get adminClient => admin;

  Dio get userClient => user;

  Dio get formRulesClient => formRules;

  Dio get uaePassClient => uaePass;
}
