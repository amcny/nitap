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

import 'package:flutter_displaymode/flutter_displaymode.dart';

Future<void> setRefreshRate() async {
  List<DisplayMode> modes = <DisplayMode>[];
  DisplayMode? active;
  DisplayMode? preferred;

  try {
    modes = await FlutterDisplayMode.supported;
    modes.forEach(print);
  } catch (e) {
    print(e);
  }
  preferred = await FlutterDisplayMode.preferred;
  active = await FlutterDisplayMode.active;
}
