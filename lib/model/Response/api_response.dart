// lib/model/api_response.dart
class ApiResponse<T> {
  final int code;
  final T data;

  ApiResponse({required this.code, required this.data});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJsonT,
  ) {
    return ApiResponse(
      code: json['code'] ?? 0,
      data: fromJsonT(json['data'] ?? {}),
    );
  }
}
