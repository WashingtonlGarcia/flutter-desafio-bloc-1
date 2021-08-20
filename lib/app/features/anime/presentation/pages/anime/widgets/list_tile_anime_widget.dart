import 'package:flutter/material.dart';

import '../../../theme/app_theme.dart';

class ListTileAnimeWidget extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? background;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;

  const ListTileAnimeWidget({Key? key, required this.title, required this.onTap, this.borderRadius, this.background, this.padding, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background ?? AppTheme.colors.listTileAnimeBackground,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Align(
            child: Row(
              children: [
                Expanded(child: Text(title, style: AppTheme.textStyles.listTileAnimeTitle)),
                const SizedBox(width: 4),
                Icon(icon ?? Icons.arrow_forward_ios, color: AppTheme.colors.listTileAnimeIcon)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
