import 'package:flutter/material.dart';

part 'app_text_styles.dart';

part 'app_colors.dart';

class AppTheme {
  AppTheme._();

  static AppColors get colors => AppColorsImpl();

  static AppTextStyles get textStyles => AppTextStylesImpl(colors: AppColorsImpl());
}
