import 'package:desafio_bloc_1/app/features/anime/presentation/theme/app_theme.dart';
import 'package:flutter/material.dart';

class CustomCircularIndicatorWidget extends CircularProgressIndicator {
  CustomCircularIndicatorWidget({Key? key}) : super(key: key, color: AppTheme.colors.circularIndicator);
}
