// ignore_for_file: avoid_print, use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';

class Database {

  Future<void> createNewUser(String? userId, String? userName, String? userEmail) async {
    print('Database createNewUser: TRY');
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        "name": userName,
        "email": userEmail,
      });
    } catch (e) {
      print('Database createNewUser: CATCH $e.toString');
      rethrow;
    }
  }

  Stream<QuerySnapshot<Map<String, dynamic>>> streamOfAppData(String userId) {
    print('Database streamOfAppData: TRY');
    try {
      return FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .orderBy("dateCreated", descending: true)
          .snapshots();
    } catch (e) {
      print('Database streamOfAppData: CATCH $e');
      rethrow;
    }
  }

  Future<void> addAppData(String content, String userId) async {
    print('Database addAppData: TRY');
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).collection("todos").add({
        'dateCreated': Timestamp.now(),
        'content': content,
        'done': false,
      });
    } catch (e) {
      print('Database addAppData: CATCH $e.toString');
      rethrow;
    }
  }

  Future<void> updateAppData(
      bool? newDoneValue, String userId, String appDataId) async {
    print('Database updateAppData: TRY');
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(appDataId)
          .update({"done": newDoneValue});
    } catch (e) {
      print('Database updateAppData: CATCH $e.toString');
      rethrow;
    }
  }

  Future<void> deleteAppData(String userId, String appDataId) async {
    print('Database deleteAppData: TRY');
    try {
      await FirebaseFirestore.instance
          .collection("users")
          .doc(userId)
          .collection("todos")
          .doc(appDataId)
          .delete();
    } catch (e) {
      print('Database deleteAppData: CATCH $e.toString');
      rethrow;
    }
  }
}
