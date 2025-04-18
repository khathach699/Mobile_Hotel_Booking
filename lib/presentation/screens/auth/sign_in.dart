import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/colors.dart';
import 'package:hotel_booking/core/constants/images.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/presentation/screens/auth/widgets/text_field_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_social_button.dart';
import 'package:hotel_booking/routes/app_route.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

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
                AppTexts.signInTitle,
                style: Theme.of(context).textTheme.displayMedium,
              ),
              SizedBox(height: Sizes.sm),
              Text(
                AppTexts.signInSubtitle,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              SizedBox(height: Sizes.spaceBtwSections),

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
                suffixIcon: Icons.lock,
                prefixIcon: Icons.visibility_off,
              ),
              SizedBox(height: Sizes.sm),
              // Forgot Password
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(value: false, onChanged: (value) {}),
                      Text(AppTexts.rememberMe),
                    ],
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        AppRoute.forgotPasswordEmail,
                      );
                    },
                    child: Text(
                      AppTexts.forgotPassword,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Sizes.spaceBtwSections),
              ButtonCustom(
                text: AppTexts.signInButton,
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoute.home,
                    (route) => false,
                  );
                },
              ),
              // Sign In Button
              SizedBox(height: Sizes.spaceBtwSections),
              // Or
              Padding(
                padding: EdgeInsets.symmetric(horizontal: Sizes.lg),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(color: AppColors.grey, thickness: 1),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: Sizes.sm),
                      child: Text(AppTexts.orWith),
                    ),
                    Expanded(
                      child: Divider(color: AppColors.grey, thickness: 1),
                    ),
                  ],
                ),
              ),

              SizedBox(height: Sizes.spaceBtwSections),

              // Sign In with Google
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Nút Google
                  ButtonSocialCustom(text: AppImages.google),
                  SizedBox(width: Sizes.md), // Khoảng cách giữa 2 nút
                  // Nút Facebook
                  ButtonSocialCustom(text: AppImages.fb),
                ],
              ),

              // Dont Have an Account
              SizedBox(height: Sizes.spaceBtwSections),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppTexts.doHaveAccount),
                  SizedBox(width: Sizes.sm),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.signup);
                    },
                    child: Text(AppTexts.signUpButton),
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
