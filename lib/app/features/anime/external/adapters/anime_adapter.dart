import '../external.dart';

class AnimeAdapter {
  static AnimeEntity fromMap({required Map<String, dynamic> map}) {
    return AnimeEntity(
      id: map['id'] as int,
      title: map['title']['rendered'] as String,
      link: map['link'] as String,
    );
  }
}
