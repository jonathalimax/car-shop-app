import 'package:car_shop_app/components/loader/loader.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:car_shop_app/repositories/cars.repository.dart';
import 'package:flutter/material.dart';
import 'package:car_shop_app/features/feed/vehicle.tabbar.screen.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.item.dart';

class VehicleFeedScreen extends StatefulWidget {
  @override
  _VehicleFeedScreenState createState() => _VehicleFeedScreenState();
}

class _VehicleFeedScreenState extends State<VehicleFeedScreen> {
  List<Car> _cars = [];
  CarsRepository _repository = CarsRepository();

  void _openDetailScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleTabBarScreen(_cars[index]),
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
      body: FutureBuilder(
        future: _repository.getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Car>> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else if (snapshot.connectionState == ConnectionState.done) {
            _cars = snapshot.data ?? [];
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return VehicleItem(
                  car: snapshot.data![index],
                  openDetailScreen: () => _openDetailScreen(index),
                );
              },
            );
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
