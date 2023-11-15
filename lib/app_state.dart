import 'package:flutter/material.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _days = prefs.getStringList('ff_days') ?? _days;
    });
    _safeInit(() {
      _secname = prefs.getString('ff_secname') ?? _secname;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  List<String> _days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];
  List<String> get days => _days;
  set days(List<String> value) {
    _days = value;
    prefs.setStringList('ff_days', value);
  }

  void addToDays(String value) {
    _days.add(value);
    prefs.setStringList('ff_days', _days);
  }

  void removeFromDays(String value) {
    _days.remove(value);
    prefs.setStringList('ff_days', _days);
  }

  void removeAtIndexFromDays(int index) {
    _days.removeAt(index);
    prefs.setStringList('ff_days', _days);
  }

  void updateDaysAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    _days[index] = updateFn(_days[index]);
    prefs.setStringList('ff_days', _days);
  }

  void insertAtIndexInDays(int index, String value) {
    _days.insert(index, value);
    prefs.setStringList('ff_days', _days);
  }

  String _secname = '';
  String get secname => _secname;
  set secname(String value) {
    _secname = value;
    prefs.setString('ff_secname', value);
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
