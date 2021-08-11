import 'package:car_shop_app/database/database.dart';
import 'package:car_shop_app/models/user.model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRepository {
  late FirebaseFirestore database;
  CollectionReference _users = FirebaseFirestore.instance.collection('users');

  UserRepository() {
    database = Database.get();
  }

  Future<UserModel?> getById(String id) async {
    final data = await database.collection('users').doc(id).get();
    if (!data.exists) return null;
    return UserModel.fromMap(data);
  }

  Future save(UserModel user) async {
    return await _users.doc(user.id).set(user.toJson());
  }
}
