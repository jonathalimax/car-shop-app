import 'package:cloud_firestore/cloud_firestore.dart';

class GalleryItem {
  final String id;
  final String url;
  final String name;

  GalleryItem({
    required this.id,
    required this.url,
    required this.name,
  });

  factory GalleryItem.fromMap(
      QueryDocumentSnapshot<Map<String, dynamic>> snippet) {
    final data = snippet.data();
    return GalleryItem(
      id: snippet.id,
      url: data['path'],
      name: data['name'],
    );
  }
}
