import 'package:car_shop_app/components/gallery/models/gallery.item.model.dart';
import 'package:car_shop_app/database/database.dart';
import 'package:car_shop_app/models/car.dart';
import 'package:car_shop_app/models/optionals.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CarsRepository {
  late FirebaseFirestore database;

  CarsRepository() {
    database = Database.get();
  }

  Future<List<Car>> getAll() async {
    List<Car> cars = [];

    final snapshot = await database.collection('cars').get();
    await Future.forEach(snapshot.docs, (doc) async {
      final document = doc as QueryDocumentSnapshot<Map<String, dynamic>>;
      final car = Car.fromMap(document);

      final optionals = await database
          .collection('cars')
          .doc(document.id)
          .collection('optionals')
          .get();

      car.optionals = optionals.docs
          .map((optional) => OptionalModel.fromMap(optional))
          .toList();

      final images = await database
          .collection('cars')
          .doc(document.id)
          .collection('images')
          .get();

      car.images =
          images.docs.map((image) => GalleryItem.fromMap(image)).toList();

      cars.add(car);
    });

    return cars;
  }
}
