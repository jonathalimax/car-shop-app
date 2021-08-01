import 'package:car_shop_app/database/database.dart';
import 'package:car_shop_app/models/optionals.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OptionalsRepository {
  late FirebaseFirestore database;

  OptionalsRepository() {
    database = Database.get();
  }

  Future<List<Optional>> getOptionals() async {
    final snapshot =
        await database.collection('optionals').orderBy('name').get();
    return snapshot.docs.map((optional) => Optional.fromMap(optional)).toList();
  }
}
