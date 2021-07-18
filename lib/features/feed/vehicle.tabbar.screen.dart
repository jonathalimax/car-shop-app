import 'package:car_shop_app/features/feed/widgets/vehicle.details.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.store.dart';
import 'package:flutter/material.dart';

class VehicleTabBarScreen extends StatelessWidget {
  const VehicleTabBarScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: [
                Tab(text: 'Detalhes'),
                Tab(text: 'Loja'),
              ],
            ),
            title: Text(
              'Veículo',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          body: TabBarView(
            children: [
              VehicleDetails(),
              VehicleStore(),
            ],
          ),
        ),
      ),
    );
  }
}
