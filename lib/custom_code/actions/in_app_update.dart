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

import 'package:in_app_update/in_app_update.dart';

Future inAppUpdate() async {
  // Check for App update from play store using the package
  // Check for available update
  await InAppUpdate.checkForUpdate().then((updateInfo) {
    if (updateInfo.updateAvailability == UpdateAvailability.updateAvailable) {
      // Update is available, prompt user to update
      InAppUpdate.performImmediateUpdate().catchError((e) => print(e));
    }
  }).catchError((e) => print(e));
}
