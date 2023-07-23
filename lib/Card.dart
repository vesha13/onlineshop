import 'package:cloud_firestore/cloud_firestore.dart';

class MyCard {
  late String docId;
  late String title;
  late String img;
  late String desc;



  // constructor
  MyCard.fromDoc(QueryDocumentSnapshot doc) {
    title = doc["title"];
    img = doc["img"];
    desc = doc["desc"];
    docId = doc.id;
  }
}
