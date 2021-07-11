import 'package:car_shop_app/features/feed/models/optionals.model.dart';
import 'package:flutter/material.dart';

class VehicleOptionals extends StatelessWidget {
  final List<OptionalsModel> optionals;

  const VehicleOptionals({
    Key key,
    this.optionals,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final childWidth = (size.width / 2) - 28;
    final childHeight = 30;
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
            children: optionals
                .map(
                  (optional) => Container(
                    padding: EdgeInsets.only(left: 14, top: 10, right: 14),
                    child: Text(
                      optional.name,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
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
