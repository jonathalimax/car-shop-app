import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:car_shop_app/database/database.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:car_shop_app/models/optionals.model.dart';
import 'package:car_shop_app/services/authentication.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CarsRepository {
  late FirebaseFirestore database;
  late AuthenticationService _authenticationService;

  CarsRepository() {
    database = Database.get();
    _authenticationService = AuthenticationService(FirebaseAuth.instance);
  }

  Future<List<Car>> getAll() async {
    List<Car> cars = [];
    final snapshot = await database.collection('cars').get();

    await Future.forEach(snapshot.docs, (doc) async {
      final document = doc as QueryDocumentSnapshot<Map<String, dynamic>>;
      final car = Car.fromMap(document);
      car.optionals = await _getOptionalsByCar(document.id);
      car.images = await _getImagesByCar(document.id);
      car.isFavorite = await _isFavorite(document.id);
      cars.add(car);
    });

    return cars;
  }

  Future<Car> getById(String id) async {
    final snapshot = await database.collection('cars').doc(id).get();
    Car car = Car.fromMap(snapshot);
    car.optionals = await _getOptionalsByCar(snapshot.id);
    car.images = await _getImagesByCar(snapshot.id);
    car.isFavorite = await _isFavorite(id);
    return car;
  }

  Future<bool> _isFavorite(String carId) async {
    final currentUser = _authenticationService.currentUser;

    if (currentUser != null) {
      final isFavorite = await database
          .collection('users')
          .doc(currentUser.uid)
          .collection('favorites')
          .where('carId', isEqualTo: carId)
          .get();
      return isFavorite.docs.isNotEmpty;
    }

    return false;
  }

  Future<List<GalleryItem>?> _getImagesByCar(String carId) async {
    final images =
        await database.collection('cars').doc(carId).collection('images').get();

    return images.docs.map((image) => GalleryItem.fromMap(image)).toList();
  }

  Future<List<OptionalModel>?> _getOptionalsByCar(String carId) async {
    final optionals = await database
        .collection('cars')
        .doc(carId)
        .collection('optionals')
        .get();

    return optionals.docs
        .map((optional) => OptionalModel.fromMap(optional))
        .toList();
  }
}
