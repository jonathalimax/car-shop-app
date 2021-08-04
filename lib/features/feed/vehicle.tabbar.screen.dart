import 'package:car_shop_app/features/feed/widgets/vehicle.details.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.store.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:flutter/material.dart';

class VehicleTabBarScreen extends StatelessWidget {
  final Car car;

  VehicleTabBarScreen({required this.car});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              labelStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
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
              VehicleDetails(car),
              VehicleStore(),
            ],
          ),
        ),
      ),
    );
  }
}
