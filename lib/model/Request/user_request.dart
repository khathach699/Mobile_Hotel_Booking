// lib/model/user_request.dart
class UserRequest {
  final String fullName;
  final String email;
  final String password;

  UserRequest({
    required this.fullName,
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {'fullName': fullName, 'email': email, 'password': password};
  }
}
