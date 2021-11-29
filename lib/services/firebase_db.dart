import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:masakin_app/models/food.dart';

class FirestoreDB {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Stream<List<Food>> getAllFoods() {
    return _firebaseFirestore.collection('foods').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Food.fromSnapshot(doc)).toList();
    });
  }
}
