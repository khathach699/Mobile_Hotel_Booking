// lib/service/token_manager.dart
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hotel_booking/http/http_client_interface.dart';
import 'token_service_interface.dart';

class TokenService implements TokenServiceInterface {
  HttpClientInterface? _httpClient;
  static const _tokenKey = 'jwt_token';
  static const _refreshTokenKey = 'refresh_token';

  TokenService(this._httpClient);

  void setHttpClient(HttpClientInterface httpClient) {
    _httpClient = httpClient;
  }

  @override
  Future<void> saveTokens(String token, String refreshToken) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
    await prefs.setString(_refreshTokenKey, refreshToken);
  }

  @override
  Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  @override
  Future<String?> getRefreshToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_refreshTokenKey);
  }

  @override
  Future<void> clearTokens() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
    await prefs.remove(_refreshTokenKey);
  }

  @override
  Future<String?> refreshToken() async {
    if (_httpClient == null) return null;

    try {
      final refreshToken = await getRefreshToken();
      if (refreshToken == null) return null;

      final response = await _httpClient!.dio.post(
        '/auth/refresh',
        data: {'refreshToken': refreshToken},
      );
      final newToken = response.data['token'];
      final newRefreshToken = response.data['refreshToken'];
      if (newToken != null && newRefreshToken != null) {
        await saveTokens(newToken, newRefreshToken);
        return newToken;
      }
      return null;
    } catch (e) {
      return null;
    }
  }
}