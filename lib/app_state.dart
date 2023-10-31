import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
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
  set days(List<String> _value) {
    _days = _value;
    prefs.setStringList('ff_days', _value);
  }

  void addToDays(String _value) {
    _days.add(_value);
    prefs.setStringList('ff_days', _days);
  }

  void removeFromDays(String _value) {
    _days.remove(_value);
    prefs.setStringList('ff_days', _days);
  }

  void removeAtIndexFromDays(int _index) {
    _days.removeAt(_index);
    prefs.setStringList('ff_days', _days);
  }

  void updateDaysAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _days[_index] = updateFn(_days[_index]);
    prefs.setStringList('ff_days', _days);
  }

  void insertAtIndexInDays(int _index, String _value) {
    _days.insert(_index, _value);
    prefs.setStringList('ff_days', _days);
  }

  String _secname = '';
  String get secname => _secname;
  set secname(String _value) {
    _secname = _value;
    prefs.setString('ff_secname', _value);
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
