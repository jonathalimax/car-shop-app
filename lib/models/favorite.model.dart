import 'package:car_shop_app/models/car.dart';

class FavoriteModel {
  final String id;
  final Car car;

  FavoriteModel({required this.id, required this.car});

  Map<String, Object?> toJson() {
    return {
      'carId': car.id,
    };
  }
}
