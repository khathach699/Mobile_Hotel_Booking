// lib/http/http.dart
import 'package:dio/dio.dart';
import 'package:hotel_booking/http/error_handler.dart';
import 'package:hotel_booking/http/http_client_interface.dart';


import '../service/token_service_interface.dart';

class HttpClient implements HttpClientInterface {
  static const String _baseUrl = 'http://10.0.2.2:8080/api';
  final Dio _dio;
  final TokenServiceInterface _tokenService;

  HttpClient(this._tokenService)
      : _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 3),
      headers: {'Content-Type': 'application/json'},
    ),
  ) {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          if (!_isAuthEndpoint(options.path)) {
            final token = await _tokenService.getToken();
            if (token != null) {
              options.headers['Authorization'] = 'Bearer $token';
            }
          }
          return handler.next(options);
        },
        onError: (DioException e, handler) async {
          if (e.response?.statusCode == 401 && !_isAuthEndpoint(e.requestOptions.path)) {
            final newToken = await _tokenService.refreshToken();
            if (newToken != null) {
              e.requestOptions.headers['Authorization'] = 'Bearer $newToken';
              return handler.resolve(await _retryRequest(e.requestOptions));
            } else {
              throw ErrorHandler.handleHttpError(401);
            }
          }
          throw ErrorHandler.handleHttpError(e.response?.statusCode);
        },
      ),
    );
  }

  bool _isAuthEndpoint(String path) {
    return path.contains('/auth/authenticate') ||
        path.contains('/user') ||
        path.contains('/auth/refresh');
  }

  Future<Response> _retryRequest(RequestOptions options) async {
    return await _dio.request(
      options.path,
      data: options.data,
      queryParameters: options.queryParameters,
      options: Options(method: options.method, headers: options.headers),
    );
  }

  @override
  Dio get dio => _dio;
}