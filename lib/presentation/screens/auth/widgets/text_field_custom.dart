// lib/presentation/screens/auth/widgets/text_field_custom.dart
import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/sizes.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool obscureText; // Thêm thuộc tính để ẩn mật khẩu
  final String? errorText; // Thêm thuộc tính để hiển thị lỗi
  final ValueChanged<String>?
  onChanged; // Thêm onChanged để gửi sự kiện đến BLoC

  const TextFieldCustom({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
    this.errorText,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      onChanged: onChanged, // Gửi sự kiện khi người dùng nhập
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: Theme.of(context).textTheme.labelMedium,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(Sizes.inputFieldRadius),
        ),
        prefixIcon:
            prefixIcon != null ? Icon(prefixIcon, size: Sizes.iconSm) : null,
        suffixIcon:
            suffixIcon != null ? Icon(suffixIcon, size: Sizes.iconSm) : null,
        errorText: errorText, // Hiển thị lỗi nếu có
      ),
    );
  }
}
