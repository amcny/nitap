import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/backend/schema/structs/index.dart';
import '/auth/firebase_auth/auth_util.dart';

String? daydate() {
  // create a code to display today name and date test
  var now = new DateTime.now();
  var formatter = new DateFormat('EEEE, MMMM d, yyyy');
  String formatted = formatter.format(now);
  return formatted;
}

bool? emailvalid(String? email) {
  // return true if the given email starts with 6
  if (email == null || email.isEmpty) {
    return false;
  }
  return email.startsWith('6');
}

List<String> generatedates() {
  // create function that generates date number from today and it should be dynamically generated
  DateTime today = DateTime.now();
  List<String> dates = [];
  for (int i = 0; i < 7; i++) {
    DateTime date = today.add(Duration(days: i));
    String formattedDate = DateFormat('dd').format(date);
    dates.add(formattedDate);
  }
  return dates;
}

int? increment() {
  // create function that increments index value each time by 1
  int index = 0;
  return () {
    index++;
    return index;
  }();
}
