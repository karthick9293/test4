import 'dart:async';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:mobiremit/core/flavours/constants.dart';

class ApiConnectivity {
  static final Connectivity _connectivity = Connectivity();

  static Future<bool> hasNetworkConnection() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      return result.isNotEmpty && result[0].rawAddress.isNotEmpty;
    } on SocketException catch (_) {
      return false;
    }
  }

  static Future<void> handleConnectivityError(
    DioException e,
    ErrorInterceptorHandler handler,
    Dio dio,
  ) async {
    debugPrint(
        '''=== CONNECTIVITY ERROR === Type: ${e.type} Message: ${e.message} Error: ${e.error} URI: ${e.requestOptions.uri} VPN Enabled: ${await Box3.checkVPN()} ====================== ''');
    if (await Box3.checkVPN()) {
      _handleVPNError(e, handler);
      return;
    }
    if (!await hasNetworkConnection()) {
      _handleNoConnectionError(e, handler);
      return;
    }
    if (_isConnectionError(e)) {
      await _handleConnectionReset(e, handler, dio);
      return;
    }
    handler.next(e);
  }

  static bool _isConnectionError(DioException e) {
    return e.type == DioExceptionType.connectionError ||
        e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout ||
        e.message?.contains('Connection reset by peer') == true ||
        e.message?.contains('SocketException') == true ||
        e.error is SocketException;
  }

  static void _handleVPNError(DioException e, ErrorInterceptorHandler handler) {
    final error = DioException(
      requestOptions: e.requestOptions,
      error: 'VPN detected. Please disable VPN to connect to the server.',
      message: 'VPN detected. Please disable VPN to connect to the server.',
      type: DioExceptionType.connectionError,
    );
    handler.reject(error);
  }

  static void _handleNoConnectionError(
    DioException e,
    ErrorInterceptorHandler handler,
  ) {
    final error = DioException(
      requestOptions: e.requestOptions,
      error: 'No internet connection. Please check your network settings.',
      message: 'No internet connection. Please check your network settings.',
      type: DioExceptionType.connectionError,
    );
    handler.reject(error);
  }

  static Future<void> _handleConnectionReset(
    DioException e,
    ErrorInterceptorHandler handler,
    Dio dio,
  ) async {
    debugPrint('Connection reset detected. Attempting to recover...');

    const maxRetries = 3;
    for (int retry = 0; retry < maxRetries; retry++) {
      try {
        await Future.delayed(Duration(seconds: 1 << retry));

        if (!await hasNetworkConnection()) {
          throw Exception('No network connection');
        }

        final requestOptions = e.requestOptions;

        requestOptions.headers['X-Retry-Count'] = retry + 1;

        final response = await dio.fetch(requestOptions);
        handler.resolve(response);
        return;
      } catch (retryError) {
        debugPrint('Retry $retry failed: $retryError');

        if (retry == maxRetries - 1) {
          handler.next(e);
        }
      }
    }
  }

  static void showConnectionToast() {
    debugPrint('Connection lost. Waiting for network to retry...');
  }
}
