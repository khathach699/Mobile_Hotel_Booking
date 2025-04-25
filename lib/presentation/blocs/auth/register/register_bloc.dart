// lib/presentation/blocs/auth/register/register_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/utils/toast_provider.dart';
import 'package:hotel_booking/model/Request/user_request.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_event.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_form_validator.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_state.dart';
import 'package:hotel_booking/service/auth_service.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final AuthService authService;
  final ToastProvider toastProvider;

  RegisterBloc(this.authService, this.toastProvider) : super(const RegisterFormState()) {
    on<FullNameChanged>((event, emit) {
      final currentState = state as RegisterFormState;
      emit(currentState.copyWith(fullName: event.fullName, fullNameError: null));
    });

    on<EmailChanged>((event, emit) {
      final currentState = state as RegisterFormState;
      emit(currentState.copyWith(email: event.email, emailError: null));
    });

    on<PasswordChanged>((event, emit) {
      final currentState = state as RegisterFormState;
      emit(currentState.copyWith(password: event.password, passwordError: null));
    });

    on<RegisterSubmitted>((event, emit) async {
      final currentState = state as RegisterFormState;

      final fullNameError = RegisterFormValidator.validateFullName(currentState.fullName);
      final emailError = RegisterFormValidator.validateEmail(currentState.email);
      final passwordError = RegisterFormValidator.validatePassword(currentState.password);

      if (fullNameError != null) {
        emit(currentState.copyWith(fullNameError: fullNameError));
        toastProvider.showError(fullNameError);
        return;
      }
      if (emailError != null) {
        emit(currentState.copyWith(emailError: emailError));
        toastProvider.showError(emailError);
        return;
      }
      if (passwordError != null) {
        emit(currentState.copyWith(passwordError: passwordError));
        toastProvider.showError(passwordError);
        return;
      }

      emit(currentState.copyWith(isLoading: true));
      try {
        final user = await authService.register(
          UserRequest(
            fullName: currentState.fullName,
            email: currentState.email,
            password: currentState.password,
          ),
        );
        emit(RegisterSuccess(user));
        toastProvider.showSuccess('Đăng ký thành công!');
      } catch (e) {
        emit(RegisterFailure(e.toString()));
        toastProvider.showError(e.toString());
        emit(currentState.copyWith(isLoading: false));
      }
    });
  }
}