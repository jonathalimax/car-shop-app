import 'package:cloud_firestore/cloud_firestore.dart';

class Optional {
  final String id;
  final String name;

  Optional({
    required this.id,
    required this.name,
  });

  factory Optional.fromMap(
      QueryDocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    return Optional(
      id: snippet.id,
      name: data['name'],
    );
  }
}
