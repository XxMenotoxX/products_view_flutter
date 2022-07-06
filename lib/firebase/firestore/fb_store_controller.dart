import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:view_products/model/main_categories.dart';
import 'package:view_products/model/product_model.dart';
import 'package:view_products/model/user_model.dart';

class FbStoreController {
  FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  var firebaseUser = FirebaseAuth.instance.currentUser;
  Future<bool> create({required MainCategories mainCategories,required String collectionName }) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .add(mainCategories.toMap())
        .then((value) => true)
        .catchError((error) => false);
  }

  Future<bool> update(
      {required String path, required MainCategories mainCategories,required String collectionName}) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(path)
        .update(mainCategories.toMap())
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
  Stream<QuerySnapshot> readUserData({required String collectionName}) async*{
    yield*_firebaseFirestore.collection(collectionName).snapshots();
  }
  Future<bool> createUser({
    required UserData userData,
    required String collectionName,
  }) async {
    return await _firebaseFirestore
        .collection(collectionName)
        .doc(firebaseUser!.uid)
        .set({"ImageUrl": userData.ImageUrl, "name": userData.name})
        .then((value) => true)
        .catchError((error) => false);
  }


  Future<bool> addProductCart({
    required Products products,
  }) async {
    return await _firebaseFirestore
        .collection('ItemCart')
        .doc(firebaseUser!.uid).collection('productId').doc(products.path)
        .set({"imagePath":products.imagePath, "name": products.name,'price':products.price})
        .then((value) => true)
        .catchError((error) => false);
  }


  Stream<QuerySnapshot> readUserProductCart() async*{
    yield*_firebaseFirestore.collection('ItemCart').doc(firebaseUser!.uid).collection('productId').snapshots();
  }

  Future<bool> deleteProducts({required String path}) async {
    return await _firebaseFirestore.collection('ItemCart').doc(firebaseUser!.uid).collection('productId')
        .doc(path)
        .delete()
        .then((value) => true)
        .catchError((error) => false);
  }
}
