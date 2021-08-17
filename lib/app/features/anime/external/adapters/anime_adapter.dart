import '../external.dart';

class AnimeAdapter {
  static AnimeEntity fromMap({required Map<String, dynamic> map}) {
    return AnimeEntity(
      id: map['id'] as int,
      title: map['title']['rendered'] as String,
      link: map['link'] as String,
    );
  }

  static List<AnimeEntity> fromList({required List<Map<String, dynamic>> list}) {
    return list.map((Map<String, dynamic> map) => fromMap(map: map)).toList();
  }
}
