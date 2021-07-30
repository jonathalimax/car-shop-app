import 'package:url_launcher/url_launcher.dart';

class WhatsappMessage {
  final String _url = 'https://wa.me/5511988419332';

  void send(String message, String phone) async {
    var params = {
      'text': message,
    };

    String url = Uri.https('wa.me', '/$phone', params).toString();
    await canLaunch(url) ? await launch(url) : throw 'Not found $_url';
  }
}
