import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;

  final _url = 'https://wa.me/5511988419332';
  void _launchURL() async =>
      await canLaunch(_url) ? await launch(_url) : throw 'Not found $_url';

  const CustomButton({
    Key key,
    this.title,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: ElevatedButton(
        onPressed: _launchURL,
        child: Text(title),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            color,
          ),
        ),
      ),
    );
  }
}
