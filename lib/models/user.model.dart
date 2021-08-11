import 'package:car_shop_app/models/car.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final List<String>? favorites;
  final List<Car>? wishlist;

  UserModel({
    this.id = '',
    this.name = '',
    this.email = '',
    this.favorites,
    this.wishlist,
  });

  factory UserModel.fromMap(DocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    if (data == null) return UserModel();

    return UserModel(
      id: snippet.id,
      name: data['name'],
      email: data['email'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
      'email': email,
    };
  }
}
