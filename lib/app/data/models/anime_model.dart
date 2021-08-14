import '../../domain/entities/anime_entity.dart';

class AnimeModel extends AnimeEntity {
  const AnimeModel({required int id, required String title, required String link}) : super(title: title, id: id, link: link);

  factory AnimeModel.fromMap({required Map<String, dynamic> map}) {
    return AnimeModel(
      id: map['id'] as int,
      title: map['title']['rendered'] as String,
      link: map['link'] as String,
    );
  }
}
