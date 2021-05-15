import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 46,
      child: ElevatedButton(
        onPressed: () {},
        child: Text('ENTER TO YOUR ACCOUNT'),
        style: ButtonStyle(
          textStyle: MaterialStateProperty.all(
            TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          backgroundColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }
}
