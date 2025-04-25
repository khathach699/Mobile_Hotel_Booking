// lib/service/token_service_interface.dart
abstract class TokenServiceInterface {
  Future<void> saveTokens(String token, String refreshToken);
  Future<String?> getToken();
  Future<String?> getRefreshToken();
  Future<String?> refreshToken();
  Future<void> clearTokens();
}