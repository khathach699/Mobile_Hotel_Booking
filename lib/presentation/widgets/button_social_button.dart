import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/colors.dart';

class ButtonSocialCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const ButtonSocialCustom({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        minimumSize: Size(48, 70),
        backgroundColor: AppColors.backgroundColor.withOpacity(0.8),
        elevation: 2,
      ),
      child: Image.asset(text, width: 30, height: 30),
    );
  }
}
