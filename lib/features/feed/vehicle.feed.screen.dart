import 'package:car_shop_app/features/feed/vehicle.details.screen.dart';
import 'package:flutter/material.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.item.dart';

class VehicleFeedScreen extends StatefulWidget {
  VehicleFeedScreen({Key key}) : super(key: key);

  @override
  _VehicleFeedScreenState createState() => _VehicleFeedScreenState();
}

class _VehicleFeedScreenState extends State<VehicleFeedScreen> {
  List<Map<String, String>> products = [
    {"name": "Roupa"},
  ];

  void _openDetailScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleDetailsScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Veículos disponíveis',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return VehicleItem(
            openDetailScreen: _openDetailScreen,
          );
        },
      ),
    );
  }
}
