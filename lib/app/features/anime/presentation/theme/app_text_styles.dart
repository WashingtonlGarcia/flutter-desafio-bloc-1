part of 'app_theme.dart';

abstract class AppTextStyles {
  TextStyle get appBarTitle;

  TextStyle get listTileAnimeTitle;

  TextStyle get messageFailure;
}

class AppTextStylesImpl implements AppTextStyles {
  final AppColors colors;

  AppTextStylesImpl({required this.colors});

  @override
  TextStyle get appBarTitle => TextStyle(color: colors.appBarTitle, fontSize: 24, fontWeight: FontWeight.w400, letterSpacing: 0);

  @override
  TextStyle get listTileAnimeTitle => TextStyle(color: colors.listTileAnimeTitle, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);

  @override
  TextStyle get messageFailure => TextStyle(color: colors.messageFailure, fontSize: 14, fontWeight: FontWeight.w400, letterSpacing: 0.25);
}
