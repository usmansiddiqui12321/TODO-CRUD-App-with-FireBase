import 'package:cloud_firestore/cloud_firestore.dart';

final FirebaseFirestore _firestore = FirebaseFirestore.instance;
final CollectionReference _mainCollection = _firestore.collection('notes');

class Database {
  static String? userId;
  static Future<void> addItem(
      {required String title, required String description}) async {
    DocumentReference documentReference = _mainCollection
        .doc(userId)
        .collection('items')
        .doc(); // to add Different User ID
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Note Item Inserted to Data Base"))
        .onError((error, stackTrace) => print("Error"));
  }

  static Future<void> updateItem(
      {required String title,
      required String description,
      required String docId}) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);
    Map<String, dynamic> data = <String, dynamic>{
      "title": title,
      "description": description
    };
    await documentReference
        .set(data)
        .whenComplete(() => print("Note Item Updated to Data Base"))
        .onError((error, stackTrace) => print("Error"));
  }

  static Stream<QuerySnapshot> readitems() {
    CollectionReference noteitemsCollection =
        _mainCollection.doc(userId).collection('items');
    return noteitemsCollection.snapshots();
  }

  static Future<void> deleteItem({required String docId}) async {
    DocumentReference documentReference =
        _mainCollection.doc(userId).collection('items').doc(docId);
    await documentReference
        .delete()
        .whenComplete(() => print("note item deleted from database"))
        .catchError((e) => print(e));
  }
}
