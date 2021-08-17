import 'package:flutter/material.dart';
import '../../../../domain/domain.dart';

class ListTileAnimeWidget extends StatelessWidget {
  final AnimeEntity anime;
  final VoidCallback onTap;
  final BorderRadius? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final IconData? icon;

  const ListTileAnimeWidget({Key? key, required this.anime, required this.onTap, this.borderRadius, this.color, this.padding, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color ?? Colors.transparent,
      borderRadius: borderRadius ?? BorderRadius.circular(4),
      child: InkWell(
        borderRadius: borderRadius ?? BorderRadius.circular(4),
        onTap: onTap,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Align(
            child: Row(
              children: [Expanded(child: Text(anime.title.trimLeft())), const SizedBox(width: 4), Icon(icon ?? Icons.arrow_forward_ios)],
            ),
          ),
        ),
      ),
    );
  }
}
