import 'package:car_shop_app/models/optionals.dart';
import 'package:flutter/material.dart';

class VehicleOptionals extends StatelessWidget {
  late final List<Optional> _optionals;

  VehicleOptionals(List<Optional> optionals) {
    this._optionals = optionals;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final childWidth = (size.width / 2) - 28;
    final childHeight = 40;
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Text(
              'Opcionais',
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            primary: false,
            childAspectRatio: childWidth / childHeight,
            children: _optionals
                .map(
                  (optional) => Padding(
                    padding: const EdgeInsets.only(left: 14, right: 14),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        optional.name,
                        maxLines: 2,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
