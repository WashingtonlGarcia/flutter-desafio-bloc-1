import 'package:url_launcher/url_launcher.dart';

typedef BoolCallback = Future<bool> Function();

class Launcher {
  Launcher._();

  static BoolCallback navigatetoLink({required String link}) {
    return () async {
      return await canLaunch(link) ? await launch(link) : throw 'Could not launch $link';
    };
  }
}
