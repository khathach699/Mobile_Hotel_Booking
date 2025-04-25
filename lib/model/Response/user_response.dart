// lib/model/user_response.dart
class UserResponse {
  final int id;
  final String fullName;
  final String email;

  UserResponse({required this.id, required this.fullName, required this.email});

  factory UserResponse.fromJson(Map<String, dynamic> json) {
    return UserResponse(
      id: json['id'] ?? 0,
      fullName: json['fullName'] ?? '',
      email: json['email'] ?? '',
    );
  }
}
