import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Color color;
  final Function action;

  const CustomButton({
    Key key,
    this.title,
    this.color,
    this.action,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: ElevatedButton(
        onPressed: action,
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
