import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData of(context) {
    var theme = Theme.of(context);
    return theme.copyWith(
      appBarTheme: AppBarTheme(
        color: AppColors.deepWhite,
        centerTitle: true,
        elevation: 0,
    
      ),
      primaryColor: AppColors.deepWhite,
      primaryColorDark: AppColors.deepBlack,
      primaryColorLight: AppColors.greyLight,
    );
  }
}

class AppColors {
  static const primaryColor = Color(0xff002651);
  static const deepBlack = Color(0xff000000);
  static const deepWhite = Color.fromRGBO(255, 255, 255, 1);
  static const lightWhite = Colors.white60;
  static const greyLight = Color(0xFFE0E0E0);
  static const greyDark = Color(0xFF757575);
  static const deepGrey = Color(0xFF616161);
  static const deepRed = Color(0xFFF44336);
  static const deepAmber = Color(0xFFFFCA28);
}
