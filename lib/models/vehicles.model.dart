import 'package:car_shop_app/models/vehicle.dart';
import 'package:flutter/foundation.dart';

class VehiclesModel extends ChangeNotifier {
  List<Vehicle> vehicles = [];

  void setFavorite(Vehicle car) {
    vehicles.firstWhere((element) => element.id == car.id).isFavorite = true;
    notifyListeners();
  }

  void removeFavorite(Vehicle car) {
    vehicles.firstWhere((element) => element.id == car.id).isFavorite = false;
    notifyListeners();
  }
}
