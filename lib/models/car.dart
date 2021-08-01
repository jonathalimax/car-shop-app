import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:car_shop_app/models/optionals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String brand;
  final String model;
  final String color;
  final String modelDate;
  final String manufactureDate;
  final String odometer;
  final int value;
  final String description;
  final String fuel;
  final String endPlate;
  final String gearbox;
  final String bodywork;
  List<Optional>? optionals;
  List<GalleryItem>? images;

  String get year {
    return '$manufactureDate/$modelDate';
  }

  Car({
    required this.id,
    required this.brand,
    required this.model,
    required this.color,
    required this.modelDate,
    required this.manufactureDate,
    required this.odometer,
    required this.value,
    required this.description,
    required this.fuel,
    required this.endPlate,
    required this.gearbox,
    required this.bodywork,
    this.images,
    this.optionals,
  });

  factory Car.fromMap(QueryDocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    return Car(
      id: snippet.id,
      brand: data['brand'],
      model: data['model'],
      color: data['color'],
      modelDate: data['modelDate'],
      manufactureDate: data['manufactureDate'],
      odometer: data['odometer'],
      value: data['value'],
      description: data['description'],
      fuel: data['fuel'],
      endPlate: data['endPlate'],
      gearbox: data['gearbox'],
      bodywork: data['bodywork'],
    );
  }
}
