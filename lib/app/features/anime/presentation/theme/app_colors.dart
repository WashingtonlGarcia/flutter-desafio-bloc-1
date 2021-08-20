part of 'app_theme.dart';

abstract class AppColors {
  Color get background;

  Color get appBarBackground;

  Color get appBarTitle;

  Color get listTileAnimeBackground;

  Color get listTileAnimeTitle;

  Color get listTileAnimeIcon;

  Color get circularIndicator;

  Color get messageFailure;
}

class AppColorsImpl implements AppColors {
  @override
  Color get appBarBackground => const Color(0xFF3f51b5);

  @override
  Color get appBarTitle => const Color(0xFFFFFFFF);

  @override
  Color get background => const Color(0xFF121212);

  @override
  Color get listTileAnimeTitle => const Color(0xFFFFFFFF);

  @override
  Color get listTileAnimeIcon => const Color(0xFFFFFFFF);

  @override
  Color get listTileAnimeBackground => const Color(0xFF1F1B24);

  @override
  Color get circularIndicator => const Color(0xFF651fff);

  @override
  Color get messageFailure => const Color(0xFFFFFFFF);
}
