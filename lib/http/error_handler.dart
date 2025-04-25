// lib/http/error_handler.dart
import 'package:dio/dio.dart';

class ErrorHandler {
  static Exception handleDioError(DioException e, String defaultMessage) {
    if (e.response != null) {
      final errorMessage = e.response?.data['message'] ?? defaultMessage;
      return Exception(errorMessage);
    }
    if (e.type == DioExceptionType.connectionTimeout) {
      return Exception('Kết nối quá thời gian');
    }
    return Exception('$defaultMessage: ${e.message}');
  }

  static Exception handleHttpError(int? statusCode) {
    switch (statusCode) {
      case 400:
        return Exception('Yêu cầu không hợp lệ');
      case 401:
        return Exception('Token hết hạn, vui lòng đăng nhập lại');
      case 403:
        return Exception('Không có quyền truy cập');
      case 500:
        return Exception('Lỗi máy chủ, thử lại sau');
      default:
        return Exception('Lỗi không xác định');
    }
  }
}