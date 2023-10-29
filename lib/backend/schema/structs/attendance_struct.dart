// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceStruct extends FFFirebaseStruct {
  AttendanceStruct({
    int? noClasses,
    String? courseName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _noClasses = noClasses,
        _courseName = courseName,
        super(firestoreUtilData);

  // "no_classes" field.
  int? _noClasses;
  int get noClasses => _noClasses ?? 0;
  set noClasses(int? val) => _noClasses = val;
  void incrementNoClasses(int amount) => _noClasses = noClasses + amount;
  bool hasNoClasses() => _noClasses != null;

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  set courseName(String? val) => _courseName = val;
  bool hasCourseName() => _courseName != null;

  static AttendanceStruct fromMap(Map<String, dynamic> data) =>
      AttendanceStruct(
        noClasses: castToType<int>(data['no_classes']),
        courseName: data['course_name'] as String?,
      );

  static AttendanceStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? AttendanceStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'no_classes': _noClasses,
        'course_name': _courseName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'no_classes': serializeParam(
          _noClasses,
          ParamType.int,
        ),
        'course_name': serializeParam(
          _courseName,
          ParamType.String,
        ),
      }.withoutNulls;

  static AttendanceStruct fromSerializableMap(Map<String, dynamic> data) =>
      AttendanceStruct(
        noClasses: deserializeParam(
          data['no_classes'],
          ParamType.int,
          false,
        ),
        courseName: deserializeParam(
          data['course_name'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AttendanceStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AttendanceStruct &&
        noClasses == other.noClasses &&
        courseName == other.courseName;
  }

  @override
  int get hashCode => const ListEquality().hash([noClasses, courseName]);
}

AttendanceStruct createAttendanceStruct({
  int? noClasses,
  String? courseName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AttendanceStruct(
      noClasses: noClasses,
      courseName: courseName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AttendanceStruct? updateAttendanceStruct(
  AttendanceStruct? attendance, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    attendance
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAttendanceStructData(
  Map<String, dynamic> firestoreData,
  AttendanceStruct? attendance,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (attendance == null) {
    return;
  }
  if (attendance.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && attendance.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final attendanceData = getAttendanceFirestoreData(attendance, forFieldValue);
  final nestedData = attendanceData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = attendance.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAttendanceFirestoreData(
  AttendanceStruct? attendance, [
  bool forFieldValue = false,
]) {
  if (attendance == null) {
    return {};
  }
  final firestoreData = mapToFirestore(attendance.toMap());

  // Add any Firestore field values
  attendance.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAttendanceListFirestoreData(
  List<AttendanceStruct>? attendances,
) =>
    attendances?.map((e) => getAttendanceFirestoreData(e, true)).toList() ?? [];
