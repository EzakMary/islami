import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';

abstract class AppTheme {
  static const TextStyle appBarTitleTextStyle = TextStyle(
      fontSize: 30, fontWeight: FontWeight.bold, color: AppColors.secondry);
  static const TextStyle textSettingStyle = TextStyle(
      fontSize: 25, fontWeight: FontWeight.bold, color: AppColors.secondry);
  static const TextStyle textSettingSwitchStyle = TextStyle(
      fontSize: 22, fontWeight: FontWeight.normal, color: AppColors.secondry);
}
