import 'package:cloud_firestore/cloud_firestore.dart';

class Pic {
  late String docId;
  late String title;
  late String image;
  late String description;



  // constructor
  Pic.fromDoc(QueryDocumentSnapshot doc) {
    title = doc["title"];
    image = doc["image"];
    description = doc["description"];
    docId = doc.id;
  }
}
