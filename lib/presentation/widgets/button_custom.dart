import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/colors.dart';
import 'package:hotel_booking/core/constants/sizes.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed; // Thêm biến onPressed
  const ButtonCustom({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size(
          double.infinity,
          Sizes.buttonHeight,
        ), // Kích thước nút
        backgroundColor: AppColors.primaryColor, // Màu nền (sử dụng màu chủ đề)
        foregroundColor: Colors.white, // Màu chữ và hiệu ứng khi nhấn
        elevation: 5, // Độ cao bóng đổ
        shadowColor: Theme.of(
          context,
        ).primaryColor.withOpacity(0.3), // Màu bóng đổ
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius), // Bo góc
        ),
        padding: EdgeInsets.symmetric(vertical: Sizes.md), // Padding bên trong
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontSize: Sizes.fontSizeSm),
      ),
      child: Text(text),
    );
  }
}
