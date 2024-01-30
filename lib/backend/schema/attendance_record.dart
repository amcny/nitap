import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AttendanceRecord extends FirestoreRecord {
  AttendanceRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "no_classes" field.
  int? _noClasses;
  int get noClasses => _noClasses ?? 0;
  bool hasNoClasses() => _noClasses != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _courseName = snapshotData['course_name'] as String?;
    _noClasses = castToType<int>(snapshotData['no_classes']);
    _user = snapshotData['user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('attendance');

  static Stream<AttendanceRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AttendanceRecord.fromSnapshot(s));

  static Future<AttendanceRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AttendanceRecord.fromSnapshot(s));

  static AttendanceRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AttendanceRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AttendanceRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AttendanceRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AttendanceRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AttendanceRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAttendanceRecordData({
  String? courseName,
  int? noClasses,
  DocumentReference? user,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_name': courseName,
      'no_classes': noClasses,
      'user': user,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AttendanceRecordDocumentEquality implements Equality<AttendanceRecord> {
  const AttendanceRecordDocumentEquality();

  @override
  bool equals(AttendanceRecord? e1, AttendanceRecord? e2) {
    return e1?.courseName == e2?.courseName &&
        e1?.noClasses == e2?.noClasses &&
        e1?.user == e2?.user &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(AttendanceRecord? e) => const ListEquality()
      .hash([e?.courseName, e?.noClasses, e?.user, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is AttendanceRecord;
}
