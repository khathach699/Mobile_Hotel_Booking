// lib/presentation/blocs/auth/register/register_state.dart
import 'package:equatable/equatable.dart';
import 'package:hotel_booking/model/Response/user_response.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterFormState extends RegisterState {
  final String fullName;
  final String email;
  final String password;
  final String? fullNameError;
  final String? emailError;
  final String? passwordError;
  final bool isLoading;

  const RegisterFormState({
    this.fullName = '',
    this.email = '',
    this.password = '',
    this.fullNameError,
    this.emailError,
    this.passwordError,
    this.isLoading = false,
  });

  bool get isFormValid =>
      fullName.isNotEmpty &&
          email.isNotEmpty &&
          password.isNotEmpty &&
          fullNameError == null &&
          emailError == null &&
          passwordError == null;

  RegisterFormState copyWith({
    String? fullName,
    String? email,
    String? password,
    String? fullNameError,
    String? emailError,
    String? passwordError,
    bool? isLoading,
  }) {
    return RegisterFormState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      fullNameError: fullNameError ?? this.fullNameError,
      emailError: emailError ?? this.emailError,
      passwordError: passwordError ?? this.passwordError,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object> get props => [
    fullName,
    email,
    password,
    isLoading,
    if (fullNameError != null) fullNameError!,
    if (emailError != null) emailError!,
    if (passwordError != null) passwordError!,
  ];
}

class RegisterSuccess extends RegisterState {
  final UserResponse user;

  const RegisterSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class RegisterFailure extends RegisterState {
  final String error;

  const RegisterFailure(this.error);

  @override
  List<Object> get props => [error];
}