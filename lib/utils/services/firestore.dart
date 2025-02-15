import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db = FirebaseFirestore.instance;

Future<List> getAllCollection({required String nameCollection}) async {
  List data = [];

  CollectionReference collectionReference = db.collection(nameCollection);

  QuerySnapshot querySnapshot = await collectionReference.get();

  for (var item in querySnapshot.docs) {
    data.add(item.data());
  }

  return data;
}

class FirestoreServics {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addDocument(String collectionName, Map<String, dynamic> data) async {
    await _db.collection(collectionName).add(data);
  }

  Future<List<Map<String, dynamic>>> getAllCollection(String nameCollection) async {
    final snapshot = await _db.collection(nameCollection).get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }
}