// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TimetableStruct extends FFFirebaseStruct {
  TimetableStruct({
    String? course,
    String? instructor,
    String? start,
    String? end,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _course = course,
        _instructor = instructor,
        _start = start,
        _end = end,
        super(firestoreUtilData);

  // "course" field.
  String? _course;
  String get course => _course ?? '';
  set course(String? val) => _course = val;
  bool hasCourse() => _course != null;

  // "instructor" field.
  String? _instructor;
  String get instructor => _instructor ?? '';
  set instructor(String? val) => _instructor = val;
  bool hasInstructor() => _instructor != null;

  // "start" field.
  String? _start;
  String get start => _start ?? '';
  set start(String? val) => _start = val;
  bool hasStart() => _start != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  set end(String? val) => _end = val;
  bool hasEnd() => _end != null;

  static TimetableStruct fromMap(Map<String, dynamic> data) => TimetableStruct(
        course: data['course'] as String?,
        instructor: data['instructor'] as String?,
        start: data['start'] as String?,
        end: data['end'] as String?,
      );

  static TimetableStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TimetableStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'course': _course,
        'instructor': _instructor,
        'start': _start,
        'end': _end,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'course': serializeParam(
          _course,
          ParamType.String,
        ),
        'instructor': serializeParam(
          _instructor,
          ParamType.String,
        ),
        'start': serializeParam(
          _start,
          ParamType.String,
        ),
        'end': serializeParam(
          _end,
          ParamType.String,
        ),
      }.withoutNulls;

  static TimetableStruct fromSerializableMap(Map<String, dynamic> data) =>
      TimetableStruct(
        course: deserializeParam(
          data['course'],
          ParamType.String,
          false,
        ),
        instructor: deserializeParam(
          data['instructor'],
          ParamType.String,
          false,
        ),
        start: deserializeParam(
          data['start'],
          ParamType.String,
          false,
        ),
        end: deserializeParam(
          data['end'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TimetableStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TimetableStruct &&
        course == other.course &&
        instructor == other.instructor &&
        start == other.start &&
        end == other.end;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([course, instructor, start, end]);
}

TimetableStruct createTimetableStruct({
  String? course,
  String? instructor,
  String? start,
  String? end,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TimetableStruct(
      course: course,
      instructor: instructor,
      start: start,
      end: end,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TimetableStruct? updateTimetableStruct(
  TimetableStruct? timetable, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    timetable
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTimetableStructData(
  Map<String, dynamic> firestoreData,
  TimetableStruct? timetable,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (timetable == null) {
    return;
  }
  if (timetable.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && timetable.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final timetableData = getTimetableFirestoreData(timetable, forFieldValue);
  final nestedData = timetableData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = timetable.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTimetableFirestoreData(
  TimetableStruct? timetable, [
  bool forFieldValue = false,
]) {
  if (timetable == null) {
    return {};
  }
  final firestoreData = mapToFirestore(timetable.toMap());

  // Add any Firestore field values
  timetable.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTimetableListFirestoreData(
  List<TimetableStruct>? timetables,
) =>
    timetables?.map((e) => getTimetableFirestoreData(e, true)).toList() ?? [];
