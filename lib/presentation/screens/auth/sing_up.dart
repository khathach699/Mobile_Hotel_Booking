import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/presentation/screens/auth/widgets/text_field_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/routes/app_route.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(Sizes.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: Sizes.appBarHeight * 2),
              // App Name
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

              // Full Name
              Text(
                AppTexts.fullNameLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: Sizes.xs),
              TextFieldCustom(
                hintText: AppTexts.fullNameHint,
                prefixIcon: Icons.person,
              ),
              SizedBox(height: Sizes.spaceBtwInputField),

              // Email Address
              Text(
                AppTexts.emailLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: Sizes.xs),
              TextFieldCustom(
                hintText: AppTexts.emailHint,
                prefixIcon: Icons.email,
              ),
              SizedBox(height: Sizes.spaceBtwInputField),

              // Password
              Text(
                AppTexts.passwordLabel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: Sizes.xs),
              TextFieldCustom(
                hintText: AppTexts.passwordHint,
                prefixIcon: Icons.lock,
                suffixIcon: Icons.visibility_off,
              ),
              SizedBox(height: Sizes.sm),

              // Forgot Password
              SizedBox(height: Sizes.spaceBtwSections),
              // Sign In Button
              ButtonCustom(
                text: AppTexts.signUpButton,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.signin,
                    (route) => false,
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
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(AppTexts.signInButton),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
