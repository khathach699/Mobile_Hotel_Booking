import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/sizes.dart';

class TextFieldCustom extends StatelessWidget {
  final String hintText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  const TextFieldCustom({
    super.key,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
      ),
    );
  }
}
