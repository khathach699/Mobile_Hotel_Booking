import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/core/constants/colors.dart';
import 'package:hotel_booking/core/constants/sizes.dart';
import 'package:hotel_booking/core/constants/strings.dart';
import 'package:hotel_booking/presentation/widgets/button_custom.dart';
import 'package:hotel_booking/routes/app_route.dart';
import 'package:pinput/pinput.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // default pin theme
    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,
      // textStyle: TextStyles.subtitle(),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.r),
        border: Border.all(color: AppColors.primaryColor),
      ),
    );

    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.sp),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 60.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,

            children: [
              // app name
              Text(
                AppTexts.enterCode,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: Sizes.sm),
              // subtitle
              Text(
                AppTexts.enterCodeSubtitle,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: Sizes.spaceBtwSections),
              // otp input
              Pinput(
                length: 4,
                defaultPinTheme: defaultPinTheme,
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    border: Border.all(
                      color: AppColors.primaryColor.withOpacity(0.7),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primaryColor.withOpacity(0.2),
                        blurRadius: 4,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                ),
                onCompleted: (pin) {
                  // Handle OTP completion
                  print("Completed: $pin");
                },
              ),
              SizedBox(height: Sizes.spaceBtwSections),
              // did not receive code
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(AppTexts.didNotReceiveCode),
                  TextButton(
                    onPressed: () {},
                    child: Text(AppTexts.resendCode),
                  ),
                ],
              ),
              // verify button
              SizedBox(height: Sizes.spaceBtwSections),
              ButtonCustom(
                text: AppTexts.continues,
                onPressed: () {
                  Navigator.pushNamed(context, AppRoute.forgotPassword);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
