import 'package:car_shop_app/database/database.dart';
import 'package:car_shop_app/models/favorite.model.dart';
import 'package:car_shop_app/repositories/cars.repository.dart';
import 'package:car_shop_app/services/authentication.service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritiesRepository {
  late FirebaseFirestore database;
  late AuthenticationService _authenticationService;
  late CarsRepository _carsRepository;
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  FavoritiesRepository() {
    database = Database.get();
    _authenticationService = AuthenticationService(FirebaseAuth.instance);
    _carsRepository = CarsRepository();
  }

  Future<bool> isFavorite(String carId) async {
    final currentUser = _authenticationService.currentUser;

    if (currentUser == null) return false;

    final favorites = await database
        .collection('users')
        .doc(currentUser.uid)
        .collection('favorites')
        .where('carId', isEqualTo: carId)
        .get();

    return favorites.docs.isNotEmpty;
  }

  Future<List<FavoriteModel>> getAll() async {
    List<FavoriteModel> favoriteList = [];
    final currentUser = _authenticationService.currentUser;

    if (currentUser == null) return [];

    final favorites = await database
        .collection('users')
        .doc(currentUser.uid)
        .collection('favorites')
        .get();

    await Future.forEach(favorites.docs, (favorite) async {
      final document = favorite as QueryDocumentSnapshot<Map<String, dynamic>>;
      final carId = document.data()['carId'];
      final car = await _carsRepository.getById(carId);
      favoriteList.add(FavoriteModel(id: favorite.id, car: car));
    });

    return favoriteList;
  }

  Future save(String carId, String userId) async {
    CollectionReference _favorites = _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('favorites');

    await _favorites.doc().set({
      'carId': '$carId',
    });
  }

  Future remove(String carId, String userId) async {
    final favorites = await _firebaseFirestore
        .collection('users')
        .doc(userId)
        .collection('favorites')
        .where('carId', isEqualTo: carId)
        .get();

    await Future.forEach(favorites.docs,
        (QueryDocumentSnapshot<Map<String, dynamic>> favorite) async {
      await favorite.reference.delete();
    });
  }
}
