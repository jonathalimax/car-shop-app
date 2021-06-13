import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Loja',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
