import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  Database._();
  static final Database _instance = Database._();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static FirebaseFirestore get() {
    return Database._instance._firestore;
  }
}
