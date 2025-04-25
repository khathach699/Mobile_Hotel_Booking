// lib/service/auth_service.dart
import 'package:dio/dio.dart';
import 'package:hotel_booking/http/error_handler.dart';
import 'package:hotel_booking/http/http_client_interface.dart';
import 'package:hotel_booking/model/Request/user_request.dart';
import 'package:hotel_booking/model/Response/user_response.dart';


import '../model/Response/api_response.dart';
import 'token_service_interface.dart';

class AuthService {
  final HttpClientInterface _httpClient;
  final TokenServiceInterface _tokenService;

  AuthService(this._httpClient, this._tokenService);

  Future<UserResponse> register(UserRequest userRequest) async {
    try {
      final response = await _httpClient.dio.post('/user', data: userRequest.toJson());
      final apiResponse = ApiResponse<UserResponse>.fromJson(
        response.data,
            (json) => UserResponse.fromJson(json),
      );
      if (apiResponse.code == 200) {
        return apiResponse.data;
      }
      throw Exception('Đăng ký thất bại: Mã phản hồi không hợp lệ');
    } catch (e) {
      throw ErrorHandler.handleDioError(e as DioException, 'Đăng ký thất bại');
    }
  }

  Future<String?> login(String email, String password) async {
    try {
      final response = await _httpClient.dio.post(
        '/auth/authenticate',
        data: {'email': email, 'password': password},
      );
      final token = response.data['token'];
      final refreshToken = response.data['refreshToken'] ?? 'dummy_refresh_token';
      if (token != null) {
        await _tokenService.saveTokens(token, refreshToken);
      }
      return token;
    } catch (e) {
      throw ErrorHandler.handleDioError(e as DioException, 'Đăng nhập thất bại');
    }
  }

  Future<UserResponse> getUserInfo() async {
    try {
      final response = await _httpClient.dio.get('/user/me');
      return UserResponse.fromJson(response.data);
    } catch (e) {
      throw ErrorHandler.handleDioError(e as DioException, 'Lấy thông tin thất bại');
    }
  }

  Future<void> logout() async {
    await _tokenService.clearTokens();
  }
}