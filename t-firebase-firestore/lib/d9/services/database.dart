// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

class Database {

  Future<void> createNewUser(String? userId, String? userName, String? userEmail) async {
    print('Database createNewUser: TRY');
    try {
      await FirebaseFirestore.instance.collection("users").doc(userId).set({
        "name": userName,
        "email": userEmail,
      });
      print('Database createNewUser: SUCCESS');
      MySnackBar(text: 'DB create $userEmail: SUCCESS').show();
    } catch (e) {
      print('Database createNewUser: CATCH $e.toString');
      MySnackBar(text: 'DB create $userEmail: FAIL').show();
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
      print('Database addAppData: SUCCESS');
      MySnackBar(text: 'DB add $content: SUCCESS').show();
    } catch (e) {
      print('Database addAppData: CATCH $e.toString');
      MySnackBar(text: 'DB add $content: FAIL').show();
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
      print('Database updateAppData: SUCCESS');
      MySnackBar(text: 'DB update $appDataId: SUCCESS').show();
    } catch (e) {
      print('Database updateAppData: CATCH $e.toString');
      MySnackBar(text: 'DB update $appDataId: FAIL').show();
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
      print('Database deleteAppData: SUCCESS');
      MySnackBar(text: 'DB update $appDataId: SUCCESS').show();
    } catch (e) {
      print('Database deleteAppData: CATCH $e.toString');
      MySnackBar(text: 'DB update $appDataId: FAIL').show();
    }
  }
}
