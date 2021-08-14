import 'package:equatable/equatable.dart';

class AnimeEntity extends Equatable {
  final int id;
  final String title;
  final String link;

  const AnimeEntity({required this.id, required this.title, required this.link});

  @override
  List<Object?> get props => [id, title, link];
}
