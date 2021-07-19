import 'package:url_launcher/url_launcher.dart';

class WhatsappMessage {
  final String _url = 'https://wa.me/5511988419332?text=';

  void send(String message) async {
    String url = '$_url$message';
    print(url);
    await canLaunch(url) ? await launch(url) : throw 'Not found $_url';
  }
}
