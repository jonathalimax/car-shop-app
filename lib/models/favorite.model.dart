import 'package:car_shop_app/models/vehicle.dart';

class FavoriteModel {
  final String id;
  final Vehicle car;

  FavoriteModel({required this.id, required this.car});

  Map<String, Object?> toJson() {
    return {
      'carId': car.id,
    };
  }
}
