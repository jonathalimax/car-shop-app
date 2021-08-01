import 'package:car_shop_app/classes/custom.colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: SpinKitPulse(
          color: CustomColors.blue,
          size: 40,
        ),
      ),
    );
  }
}
