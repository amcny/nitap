import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class MarksRecord extends FirestoreRecord {
  MarksRecord._(
    super.reference,
    super.data,
  ) {
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

  // "minor1" field.
  String? _minor1;
  String get minor1 => _minor1 ?? '';
  bool hasMinor1() => _minor1 != null;

  // "mid" field.
  String? _mid;
  String get mid => _mid ?? '';
  bool hasMid() => _mid != null;

  // "minor2" field.
  String? _minor2;
  String get minor2 => _minor2 ?? '';
  bool hasMinor2() => _minor2 != null;

  // "end" field.
  String? _end;
  String get end => _end ?? '';
  bool hasEnd() => _end != null;

  void _initializeFields() {
    _courseName = snapshotData['course_name'] as String?;
    _user = snapshotData['user'] as DocumentReference?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _minor1 = snapshotData['minor1'] as String?;
    _mid = snapshotData['mid'] as String?;
    _minor2 = snapshotData['minor2'] as String?;
    _end = snapshotData['end'] as String?;
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
  String? minor1,
  String? mid,
  String? minor2,
  String? end,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'course_name': courseName,
      'user': user,
      'created_time': createdTime,
      'minor1': minor1,
      'mid': mid,
      'minor2': minor2,
      'end': end,
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
        e1?.minor1 == e2?.minor1 &&
        e1?.mid == e2?.mid &&
        e1?.minor2 == e2?.minor2 &&
        e1?.end == e2?.end;
  }

  @override
  int hash(MarksRecord? e) => const ListEquality().hash([
        e?.courseName,
        e?.user,
        e?.createdTime,
        e?.minor1,
        e?.mid,
        e?.minor2,
        e?.end
      ]);

  @override
  bool isValidKey(Object? o) => o is MarksRecord;
}
