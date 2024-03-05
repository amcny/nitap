// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> deleteUser(String uid) async {
  try {
    // Delete the user document from Firestore
    await FirebaseFirestore.instance.collection('users').doc(uid).delete();

    // Delete the user from FirebaseAuth
    final user = await FirebaseAuth.instance.currentUser;
    if (user != null) {
      await user.delete();
      print('User deleted successfully');
    } else {
      print('User not found.');
    }
  } catch (e) {
    print('Error while deleting the user: $e');
  }
}
