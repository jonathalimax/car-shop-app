import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:car_shop_app/models/optionals.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Car {
  final String id;
  final String brand;
  final String model;
  final String color;
  final String manufactureDate;
  final String modelDate;
  final String odometer;
  final int value;
  final String description;
  final String fuel;
  final String endPlate;
  final String gearbox;
  final String bodywork;
  List<OptionalModel>? optionals;
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

  factory Car.fromMap(DocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    if (data == null)
      return Car(
        id: '',
        brand: '',
        model: '',
        color: '',
        modelDate: '',
        manufactureDate: '',
        odometer: '',
        value: 0,
        description: '',
        fuel: '',
        endPlate: '',
        gearbox: '',
        bodywork: '',
      );
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

  Map<String, dynamic> toJson() {
    return {
      'brand': brand,
      'model': model,
      'color': color,
      'modelDate': modelDate,
      'manufactureDate': manufactureDate,
      'odometer': odometer,
      'value': value,
      'description': description,
      'fuel': fuel,
      'endPlate': endPlate,
      'gearbox': gearbox,
      'bodywork': bodywork
    };
  }
}
