import 'package:flutter/material.dart';
import 'package:hotel_booking/core/constants/typography.dart';

class AppTheme {
  // Light theme
  static ThemeData lightTheme = ThemeData(
    primarySwatch: Colors.blue,
    // scaffoldBackgroundColor: backgroundColor,
    textTheme: TextTheme(
      displayLarge: AppTypography.heading1,
      displayMedium: AppTypography.heading2,
      displaySmall: AppTypography.heading3,
      headlineLarge: AppTypography.titleLarge,
      headlineMedium: AppTypography.titleMedium,
      headlineSmall: AppTypography.titleSmall,
      bodyLarge: AppTypography.bodyLarge,
      bodyMedium: AppTypography.bodyMedium,
      bodySmall: AppTypography.bodySmall,
      labelLarge: AppTypography.labelLarge,
      labelMedium: AppTypography.labelMedium,
      labelSmall: AppTypography.caption,
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: buttonTextColor,
    //     backgroundColor: primaryColor,
    //     minimumSize: Size(Sizes.buttonWidth, Sizes.buttonHeight),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Sizes.buttonRadius),
    //     ),
    //     textStyle: AppTypography.labelLarge,
    //   ),
    // ),
    // appBarTheme: AppBarTheme(
    //   backgroundColor: primaryColor,
    //   titleTextStyle: AppTypography.heading2.copyWith(color: buttonTextColor),
    // ),
  );

  // Dark theme (tùy chọn)
  static ThemeData darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: Colors.grey[900],
    textTheme: TextTheme(
      displayLarge: AppTypography.heading1.copyWith(color: Colors.white),
      displayMedium: AppTypography.heading2.copyWith(color: Colors.white),
      displaySmall: AppTypography.heading3.copyWith(color: Colors.white),
      headlineLarge: AppTypography.titleLarge.copyWith(color: Colors.white),
      headlineMedium: AppTypography.titleMedium.copyWith(color: Colors.white),
      headlineSmall: AppTypography.titleSmall.copyWith(color: Colors.white),
      bodyLarge: AppTypography.bodyLarge.copyWith(color: Colors.white),
      bodyMedium: AppTypography.bodyMedium.copyWith(color: Colors.white),
      bodySmall: AppTypography.bodySmall.copyWith(color: Colors.white),
      labelLarge: AppTypography.labelLarge.copyWith(color: Colors.white),
      labelMedium: AppTypography.labelMedium.copyWith(color: Colors.white),
      labelSmall: AppTypography.caption.copyWith(color: Colors.white),
    ),
    // elevatedButtonTheme: ElevatedButtonThemeData(
    //   style: ElevatedButton.styleFrom(
    //     foregroundColor: buttonTextColor,
    //     backgroundColor: primaryColor,
    //     minimumSize: Size(Sizes.buttonWidth, Sizes.buttonHeight),
    //     shape: RoundedRectangleBorder(
    //       borderRadius: BorderRadius.circular(Sizes.buttonRadius),
    //     ),
    //     textStyle: AppTypography.labelLarge.copyWith(color: Colors.white),
    //   ),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.grey[900],
      titleTextStyle: AppTypography.heading2.copyWith(color: Colors.white),
    ),
  );
}
