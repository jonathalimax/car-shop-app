import 'package:car_shop_app/services/authentication.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Spacer(flex: 2),
              logoImage(),
              Spacer(flex: 3),
              appleSignButton(),
              SizedBox(height: 10),
              googleSignButton(),
              Spacer(flex: 1),
            ],
          ),
        ),
      ),
    );
  }

  _googleSign(BuildContext context) async {
    await context.read<AuthenticationService>().signInWithGoogle();
  }

  _appleSign() {}

  Container logoImage() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14),
      child: Image(
        image: AssetImage('resources/images/honda-logo.png'),
        height: 150,
        width: 150,
        fit: BoxFit.cover,
      ),
    );
  }

  Container googleSignButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.black,
          shadowColor: Colors.transparent,
          minimumSize: Size(double.infinity, 50),
          elevation: 0,
        ),
        onPressed: () => _googleSign(context),
        icon: FaIcon(
          FontAwesomeIcons.google,
          color: Colors.red,
          size: 20,
        ),
        label: Text(
          'Entrar com Google',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Container appleSignButton() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          primary: Colors.transparent,
          onPrimary: Colors.black,
          shadowColor: Colors.transparent,
          minimumSize: Size(double.infinity, 50),
          elevation: 0,
        ),
        onPressed: () {},
        icon: FaIcon(
          FontAwesomeIcons.apple,
          color: Colors.black,
        ),
        label: Text(
          'Entrar com Apple',
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
