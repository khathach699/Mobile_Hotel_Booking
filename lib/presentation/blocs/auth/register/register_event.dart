// lib/presentation/blocs/auth/register/register_event.dart
import 'package:equatable/equatable.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class FullNameChanged extends RegisterEvent {
  final String fullName;

  const FullNameChanged(this.fullName);

  @override
  List<Object> get props => [fullName];
}

class EmailChanged extends RegisterEvent {
  final String email;

  const EmailChanged(this.email);

  @override
  List<Object> get props => [email];
}

class PasswordChanged extends RegisterEvent {
  final String password;

  const PasswordChanged(this.password);

  @override
  List<Object> get props => [password];
}

class RegisterSubmitted extends RegisterEvent {
  const RegisterSubmitted();

  @override
  List<Object> get props => [];
}