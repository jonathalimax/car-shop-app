import 'package:cloud_firestore/cloud_firestore.dart';

class OptionalModel {
  final String id;
  final String name;

  OptionalModel({
    required this.id,
    required this.name,
  });

  factory OptionalModel.fromMap(
      QueryDocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    return OptionalModel(
      id: snippet.id,
      name: data['name'],
    );
  }

  Map<String, Object?> toJson() {
    return {
      'name': name,
    };
  }
}
