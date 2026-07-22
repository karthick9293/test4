import 'package:dio/dio.dart';
import '../core/flavours/constants.dart';


class ApiErrorExtractor {
  static String extractErrorMessage(DioException e) {
    return extractErrorMessageFromData(e.response?.data,
        apiPath: e.requestOptions.path);
  }

  static String extractErrorMessageFromData(dynamic data, {String? apiPath}) {
    String? endpoint;
    if (apiPath != null) {
      final segments = apiPath.split('/').where((s) => s.isNotEmpty);
      endpoint = segments.isNotEmpty ? segments.last : apiPath;
    }

    final String genericError = "Getting Unexpected Error. Please Retry.";
    final String apiSuffix = (AppConfigs.env != Environment.prod && endpoint != null)
        ? "\nAPI: $endpoint"
        : "";

    if (data == null || data is! Map<String, dynamic>) {
      return data == null ? '' : "$genericError$apiSuffix";
    }

    // Handle technical RuleErrors format with a generic message as requested
    if (data['Body']?['RootNode']?['RuleErrors'] != null &&
        (data['Body']['RootNode']['RuleErrors'] as List).isNotEmpty) {
      return "$genericError$apiSuffix";
    }

    String? error = data['Body']?['RootNode']?['SourceErrorDetails'];
    if (error == null || error.isEmpty) {
      error = data['Body']?['RootNode']?['SourceErrorMessage'];
    }

    if (error == null || error.isEmpty) {
      error = data['CustomMessageDetails']?['MessageDescription'];
    }

    if (error == null || error.isEmpty) {
      error = data[
          'StatusMessaage']; // Matching the spelling used in other parts of the app
    }

    if (error == null || error.isEmpty) {
      error = data['message'];
    }

    return (error == null || error.isEmpty)
        ? "$genericError$apiSuffix"
        : error;
  }
}
