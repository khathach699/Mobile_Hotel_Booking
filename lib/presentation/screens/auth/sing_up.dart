import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/di/di.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_bloc.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_event.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_state.dart';
import 'package:hotel_booking/presentation/screens/auth/widgets/text_field_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/routes/app_route.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<RegisterBloc>(),
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Sizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Sizes.appBarHeight * 2),
                Text(
                  AppTexts.signUpTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: Sizes.sm),
                Text(
                  AppTexts.signUpSubtitle,
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(height: Sizes.spaceBtwSections),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    final formState = state is RegisterFormState ? state : const RegisterFormState();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppTexts.fullNameLabel, style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(height: Sizes.xs),
                        TextFieldCustom(
                          hintText: AppTexts.fullNameHint,
                          prefixIcon: Icons.person,
                          onChanged: (value) => context.read<RegisterBloc>().add(FullNameChanged(value)),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: Sizes.spaceBtwInputField),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    final formState = state is RegisterFormState ? state : const RegisterFormState();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppTexts.emailLabel, style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(height: Sizes.xs),
                        TextFieldCustom(
                          hintText: AppTexts.emailHint,
                          prefixIcon: Icons.email,
                          onChanged: (value) => context.read<RegisterBloc>().add(EmailChanged(value)),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: Sizes.spaceBtwInputField),
                BlocBuilder<RegisterBloc, RegisterState>(
                  builder: (context, state) {
                    final formState = state is RegisterFormState ? state : const RegisterFormState();
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(AppTexts.passwordLabel, style: Theme.of(context).textTheme.labelLarge),
                        SizedBox(height: Sizes.xs),
                        TextFieldCustom(
                          hintText: AppTexts.passwordHint,
                          prefixIcon: Icons.lock,
                          suffixIcon: Icons.visibility_off,
                          obscureText: true,
                          onChanged: (value) => context.read<RegisterBloc>().add(PasswordChanged(value)),
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(height: Sizes.sm),
                SizedBox(height: Sizes.spaceBtwSections),
                BlocConsumer<RegisterBloc, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterSuccess) {
                      Navigator.pushNamedAndRemoveUntil(context, AppRoute.signin, (route) => false);
                    }
                  },
                  builder: (context, state) {
                    final formState = state is RegisterFormState ? state : const RegisterFormState();
                    return ButtonCustom(
                      text: AppTexts.signUpButton,
                      isLoading: formState.isLoading,
                      onPressed: () => context.read<RegisterBloc>().add(const RegisterSubmitted()),
                    );
                  },
                ),
                SizedBox(height: Sizes.spaceBtwSections),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(AppTexts.alreadyHaveAccount),
                    SizedBox(width: Sizes.sm),
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(AppTexts.signInButton),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}