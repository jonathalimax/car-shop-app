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
          return ProductItem();
        },
      ),
    );
  }
}
