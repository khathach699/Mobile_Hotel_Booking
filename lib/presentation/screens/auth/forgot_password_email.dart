import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/presentation/screens/auth/widgets/text_field_custom.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/routes/app_route.dart';

class ForgotPasswordEmailScreen extends StatelessWidget {
  const ForgotPasswordEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Sizes.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: Sizes.appBarHeight * 2),
                // App Name
                Text(
                  AppTexts.forgotPasswordTitle,
                  style: Theme.of(context).textTheme.displayMedium,
                ),
                SizedBox(height: Sizes.sm),
                // Subtitle
                Text(
                  AppTexts.forgotPasswordSubtitle,
                  style: Theme.of(context).textTheme.labelSmall,
                ),
                SizedBox(height: Sizes.spaceBtwSections),
                // Email Address
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Email Label
                    Text(
                      AppTexts.emailLabel,
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(height: Sizes.xs),
                    // Email TextField
                    TextFieldCustom(hintText: AppTexts.emailHint),
                    SizedBox(height: Sizes.spaceBtwSections),

                    // Next Button
                    ButtonCustom(
                      text: AppTexts.next,
                      onPressed: () {
                        // Handle next button press
                        Navigator.pushNamed(context, AppRoute.otp);
                      },
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
