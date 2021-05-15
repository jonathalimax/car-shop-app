import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Forgot Password',
        labelStyle: TextStyle(
          color: Colors.grey,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      style: TextStyle(
        fontSize: 18,
      ),
    );
  }
}
