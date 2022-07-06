import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:view_products/model/admin_model.dart';
import 'package:view_products/model/main_categories.dart';

class FbStoreControllerUser {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  Future<bool> create({required UserModel userModel,required String collectionName }) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .add(userModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> update(
      {required String path, required UserModel  userModel,required String collectionName}) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(path)
        .update(userModel.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> delete({required String path,required String collectionName}) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }

  Stream<QuerySnapshot> read({required String collectionName}) async*{
    yield*_firebaseFirestore.collection(collectionName).snapshots();
  }
}
