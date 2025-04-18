import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/presentation/screens/auth/widgets/text_field_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/routes/app_route.dart';

class ForgotPassworScreen extends StatelessWidget {
  const ForgotPassworScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                SizedBox(height: Sizes.appBarHeight * 2),
                // App logo
                Text(
                  AppTexts.newPasswordTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: Sizes.sm),
                // App subtitle
                Text(
                  AppTexts.newPasswordSubtitle,
                  style: Theme.of(
                    context,
                  ).textTheme.titleSmall?.copyWith(color: Colors.grey),
                ),
                SizedBox(height: Sizes.spaceBtwSections),
                Text(
                  AppTexts.newPasswordLabel,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: Sizes.sm),

                // New password field
                TextFieldCustom(
                  hintText: AppTexts.newPasswordHint,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),
                SizedBox(height: Sizes.spaceBtwInputField),

                // Confirm password field
                Text(
                  AppTexts.confirmPasswordLabel,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                SizedBox(height: Sizes.sm),

                // New password field
                TextFieldCustom(
                  hintText: AppTexts.confirmPasswordHint,
                  prefixIcon: Icons.lock,
                  suffixIcon: Icons.visibility_off,
                ),

                SizedBox(height: Sizes.spaceBtwSections),

                // Reset password button
                ButtonCustom(
                  text: AppTexts.resetPasswordButton,
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                      context,
                      AppRoute.signin,
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
