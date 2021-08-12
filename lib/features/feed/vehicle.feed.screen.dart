import 'package:car_shop_app/components/loader/loader.dart';
import 'package:car_shop_app/models/vehicles.model.dart';
import 'package:car_shop_app/models/vehicle.dart';
import 'package:car_shop_app/repositories/cars.repository.dart';
import 'package:flutter/material.dart';
import 'package:car_shop_app/features/feed/vehicle.tabbar.screen.dart';
import 'package:car_shop_app/features/feed/widgets/vehicle.item.dart';
import 'package:provider/provider.dart';

class VehicleFeedScreen extends StatefulWidget {
  @override
  _VehicleFeedScreenState createState() => _VehicleFeedScreenState();
}

class _VehicleFeedScreenState extends State<VehicleFeedScreen>
    with AutomaticKeepAliveClientMixin {
  CarsRepository _repository = CarsRepository();

  void _openDetailScreen(int index) {
    final model = Provider.of<VehiclesModel>(context);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => VehicleTabBarScreen(car: model.vehicles[index]),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final model = Provider.of<VehiclesModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Veículos disponíveis',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _repository.getAll(),
        builder: (BuildContext context, AsyncSnapshot<List<Vehicle>> snapshot) {
          if (snapshot.hasError) {
            return Container();
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else if (snapshot.connectionState == ConnectionState.done) {
            model.vehicles = snapshot.data ?? [];
            return buildVehiclesList(context, model);
          } else {
            return Container();
          }
        },
      ),
    );
  }

  ListView buildVehiclesList(BuildContext context, VehiclesModel model) {
    return ListView.builder(
      itemCount: model.vehicles.length,
      itemBuilder: (context, index) {
        return Consumer<VehiclesModel>(
          builder: (context, model, _) {
            return VehicleItem(
              car: model.vehicles[index],
              openDetailScreen: () => _openDetailScreen(index),
            );
          },
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
