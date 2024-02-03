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

bool? emailvalid(String? email) {
  // return true if the given email starts with 6
  if (email == null || email.isEmpty) {
    return false;
  }
  return email.startsWith('6');
}

List<DateTime> generateFutureDates(int numberOfDays) {
  final now = DateTime.now();
  final workdays = <DateTime>[];

  // Start with the current day
  var currentDay = now;

  // Generate workdays until we reach the desired number
  while (workdays.length < numberOfDays) {
    // Check if the current day is not a weekend (Saturday or Sunday)
    if (currentDay.weekday != DateTime.saturday &&
        currentDay.weekday != DateTime.sunday) {
      workdays.add(currentDay);
    }
    // Move to the next day
    currentDay = currentDay.add(Duration(days: 1));
  }

  return workdays;
}
