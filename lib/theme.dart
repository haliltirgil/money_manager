import 'package:flutter/material.dart';

class AppColors {
  const AppColors();

  static const Color fontColor = Colors.white;

  static const greyColor = const Color(0xFF2e2823);
  static const greenColor = const Color(0xFF36A40F);
  static const redColor = const Color(0xFFC60707);
  static const blackColor = const Color(0xFF000000);
  static const whiteColor = const Color(0xFFFFFFFF);

  static const TextStyle fontStyle =
      TextStyle(color: AppColors.whiteColor, fontFamily: 'Rubik');
}

class LogoConstants {
  static const String appBarLogo = 'assets/logo.svg';
}
