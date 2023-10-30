import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MarksRecord extends FirestoreRecord {
  MarksRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "course_name" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  bool hasCourseName() => _courseName != null;

  // "user" field.
  DocumentReference? _user;
  DocumentReference? get user => _user;
  bool hasUser() => _user != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "marks" field.
  String? _marks;
  String get marks => _marks ?? '';
  bool hasMarks() => _marks != null;

  void _initializeFields() {
    _courseName = snapshotData['course_name'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _marks = snapshotData['marks'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('marks');

  static Stream<MarksRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MarksRecord.fromSnapshot(s));

  static Future<MarksRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MarksRecord.fromSnapshot(s));

  static MarksRecord fromSnapshot(DocumentSnapshot snapshot) => MarksRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MarksRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MarksRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MarksRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MarksRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMarksRecordData({
  String? courseName,
  DocumentReference? user,
  DateTime? createdTime,
  String? marks,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_name': courseName,
      'user': user,
      'created_time': createdTime,
      'marks': marks,
    }.withoutNulls,
  );

  return firestoreData;
}

class MarksRecordDocumentEquality implements Equality<MarksRecord> {
  const MarksRecordDocumentEquality();

  @override
  bool equals(MarksRecord? e1, MarksRecord? e2) {
    return e1?.courseName == e2?.courseName &&
        e1?.user == e2?.user &&
        e1?.createdTime == e2?.createdTime &&
        e1?.marks == e2?.marks;
  }

  @override
  int hash(MarksRecord? e) => const ListEquality()
      .hash([e?.courseName, e?.user, e?.createdTime, e?.marks]);

  @override
  bool isValidKey(Object? o) => o is MarksRecord;
}
