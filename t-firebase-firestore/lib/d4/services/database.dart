// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:robbinlaw/widgets/mysnackbar.dart';

class Database {
  Future<void> create() async {
    try {
      await FirebaseFirestore.instance.collection('users').doc('testUser').set({
        'firstName': 'test',
        'lastName': 'user',
      });
      print('Database create: SUCCESS');
      MySnackBar(text: 'DB create: SUCCESS').show();
    } catch (e) {
      print('Database create: CATCH $e.toString');
      MySnackBar(text: 'DB create: FAIL').show();
    }
  }

  Future<void> read() async {
    DocumentSnapshot documentSnapshot;
    try {
      documentSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .get();
      print('Database read: ${documentSnapshot.data()}');
      MySnackBar(text: 'DB read: SUCCESS').show();
    } catch (e) {
      print('Database read: CATCH $e.toString');
      MySnackBar(text: 'DB read: FAIL').show();
      rethrow;
    }
  }

  Future<void> update() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .update({
        'firstName': 'testUpdated',
        'lastName': 'userUpdated',
      });
      print('Database update: SUCCESS');
      MySnackBar(text: 'DB update: SUCCESS').show();
    } catch (e) {
      print('Database update: CATCH $e.toString');
      MySnackBar(text: 'DB update: FAIL').show();
    }
  }

  Future<void> delete() async {
    try {
      await FirebaseFirestore.instance
          .collection('users')
          .doc('testUser')
          .delete();
      print('Database delete: SUCCESS');
      MySnackBar(text: 'DB delete: SUCCESS').show();
    } catch (e) {
      print('Database delete: CATCH $e.toString');
      MySnackBar(text: 'DB delete: FAIL').show();
    }
  }
}
