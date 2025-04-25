// lib/presentation/widgets/button_custom.dart
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/colors.dart';
import 'package:hotel_booking/core/constants/sizes.dart';

class ButtonCustom extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading; // Thêm thuộc tính isLoading

  const ButtonCustom({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // Vô hiệu hóa nút khi đang tải
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, Sizes.buttonHeight),
        backgroundColor: AppColors.primaryColor,
        foregroundColor: Colors.white,
        elevation: 5,
        shadowColor: Theme.of(context).primaryColor.withOpacity(0.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(Sizes.buttonRadius),
        ),
        padding: EdgeInsets.symmetric(vertical: Sizes.md),
        textStyle: Theme.of(
          context,
        ).textTheme.labelLarge?.copyWith(fontSize: Sizes.fontSizeSm),
      ),
      child:
          isLoading
              ? const SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2,
                ),
              )
              : Text(text),
    );
  }
}
