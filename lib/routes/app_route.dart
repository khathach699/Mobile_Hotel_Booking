import 'package:flutter/widgets.dart';
import 'package:hotel_booking/presentation/screens/auth/forgot_password.dart';
import 'package:hotel_booking/presentation/screens/auth/forgot_password_email.dart';
import 'package:hotel_booking/presentation/screens/auth/otp.dart';
import 'package:hotel_booking/presentation/screens/auth/sign_in.dart';
import 'package:hotel_booking/presentation/screens/auth/sing_up.dart';

class AppRoute {
  static const String splash = '/';
  static const String home = '/home';
  static const String signin = '/signIn';
  static const String signup = '/signUp';
  static const String forgotPasswordEmail = '/forgot-password-email';
  static const String forgotPassword = '/forgot-password';
  static const String otp = '/otp';

  static final Map<String, WidgetBuilder> routes = {
    signin: (context) => const SignInScreen(),
    signup: (context) => const SignUpScreen(),
    forgotPasswordEmail: (context) => const ForgotPasswordEmailScreen(),
    forgotPassword: (context) => const ForgotPassworScreen(),
    otp: (context) => const OTPScreen(),
  };
}
