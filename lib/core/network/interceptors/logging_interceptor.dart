import 'dart:developer' as developer;
import 'package:dio/dio.dart';

/// Interceptor for logging HTTP requests and responses
class LoggingInterceptor extends Interceptor {
  static const String _tag = 'HTTP';

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    _logRequest(options);
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    _logResponse(response);
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    _logError(err);
    handler.next(err);
  }

  void _logRequest(RequestOptions options) {
    final message = StringBuffer();
    message.writeln('🚀 REQUEST [$_tag]');
    message.writeln('Method: ${options.method}');
    message.writeln('URL: ${options.uri}');

    if (options.headers.isNotEmpty) {
      message.writeln('Headers:');
      options.headers.forEach((key, value) {
        // Hide sensitive headers
        if (_isSensitiveHeader(key)) {
          message.writeln('  $key: [HIDDEN]');
        } else {
          message.writeln('  $key: $value');
        }
      });
    }

    if (options.queryParameters.isNotEmpty) {
      message.writeln('Query Parameters:');
      options.queryParameters.forEach((key, value) {
        message.writeln('  $key: $value');
      });
    }

    if (options.data != null) {
      message.writeln('Body: ${_formatData(options.data)}');
    }

    developer.log(message.toString(), name: _tag);
  }

  void _logResponse(Response response) {
    final message = StringBuffer();
    message.writeln('✅ RESPONSE [$_tag]');
    message.writeln('Status Code: ${response.statusCode}');
    message.writeln('URL: ${response.requestOptions.uri}');

    if (response.headers.map.isNotEmpty) {
      message.writeln('Headers:');
      response.headers.map.forEach((key, value) {
        message.writeln('  $key: ${value.join(', ')}');
      });
    }

    if (response.data != null) {
      message.writeln('Body: ${_formatData(response.data)}');
    }

    developer.log(message.toString(), name: _tag);
  }

  void _logError(DioException error) {
    final message = StringBuffer();
    message.writeln('❌ ERROR [$_tag]');
    message.writeln('Type: ${error.type}');
    message.writeln('Message: ${error.message}');
    message.writeln('URL: ${error.requestOptions.uri}');

    if (error.response != null) {
      message.writeln('Status Code: ${error.response?.statusCode}');
      message.writeln('Response: ${_formatData(error.response?.data)}');
    }

    developer.log(message.toString(), name: _tag, level: 1000);
  }

  String _formatData(dynamic data) {
    if (data == null) return 'null';

    if (data is Map || data is List) {
      try {
        return data.toString();
      } catch (e) {
        return 'Failed to format data: $e';
      }
    }

    return data.toString();
  }

  bool _isSensitiveHeader(String key) {
    final sensitiveHeaders = [
      'authorization',
      'cookie',
      'set-cookie',
      'x-api-key',
      'x-auth-token',
    ];
    return sensitiveHeaders.contains(key.toLowerCase());
  }
}
