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
