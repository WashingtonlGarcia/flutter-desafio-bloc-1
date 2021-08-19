import 'package:equatable/equatable.dart';

class AnimePostDto extends Equatable{
  final int page;

  const AnimePostDto({required this.page});

  @override
  List<Object?> get props => [page];
}
