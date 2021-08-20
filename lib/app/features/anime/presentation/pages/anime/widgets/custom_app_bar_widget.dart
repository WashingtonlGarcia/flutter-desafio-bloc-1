import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class CustomAppBarWidget extends AppBar {
  CustomAppBarWidget({Key? key, required String title, TextStyle? titleStyle, Color? background})
      : super(
          key: key,
          backgroundColor: background ?? AppTheme.colors.appBarBackground,
          title: Text(title, style: titleStyle ?? AppTheme.textStyles.appBarTitle),
        );
}
