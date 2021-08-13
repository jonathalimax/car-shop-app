import 'package:car_shop_app/models/vehicles.model.dart';
import 'package:car_shop_app/repositories/favorities.repository.dart';
import 'package:car_shop_app/services/authentication.service.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginScreen extends StatefulWidget {
  final Future Function()? onSuccessCallback;

  LoginScreen({this.onSuccessCallback});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
    await _updateFavoriteVehicles(context);
    await _shouldPopWithCallback();
  }

  _appleSign(BuildContext context) async {
    await context.read<AuthenticationService>().signInWithApple();
    await _updateFavoriteVehicles(context);
    await _shouldPopWithCallback();
  }

  _updateFavoriteVehicles(BuildContext context) async {
    final favorites = await context.read<FavoritiesRepository>().getAll();
    if (_scaffoldKey.currentContext != null) {
      final vehicleModel = Provider.of<VehiclesModel>(
          _scaffoldKey.currentContext!,
          listen: false);
      vehicleModel.needsUpdate(favorites);
    }
  }

  _shouldPopWithCallback() async {
    if (widget.onSuccessCallback != null) {
      await widget.onSuccessCallback!();
      Navigator.pop(context);
    }
  }

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
        onPressed: () => _appleSign(context),
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
