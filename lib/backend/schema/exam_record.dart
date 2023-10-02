import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ExamRecord extends FirestoreRecord {
  ExamRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "minor1" field.
  String? _minor1;
  String get minor1 => _minor1 ?? '';
  bool hasMinor1() => _minor1 != null;

  // "minor2" field.
  String? _minor2;
  String get minor2 => _minor2 ?? '';
  bool hasMinor2() => _minor2 != null;

  // "midsem" field.
  String? _midsem;
  String get midsem => _midsem ?? '';
  bool hasMidsem() => _midsem != null;

  // "endsem" field.
  String? _endsem;
  String get endsem => _endsem ?? '';
  bool hasEndsem() => _endsem != null;

  void _initializeFields() {
    _minor1 = snapshotData['minor1'] as String?;
    _minor2 = snapshotData['minor2'] as String?;
    _midsem = snapshotData['midsem'] as String?;
    _endsem = snapshotData['endsem'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('exam');

  static Stream<ExamRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ExamRecord.fromSnapshot(s));

  static Future<ExamRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ExamRecord.fromSnapshot(s));

  static ExamRecord fromSnapshot(DocumentSnapshot snapshot) => ExamRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ExamRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ExamRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ExamRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ExamRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createExamRecordData({
  String? minor1,
  String? minor2,
  String? midsem,
  String? endsem,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'minor1': minor1,
      'minor2': minor2,
      'midsem': midsem,
      'endsem': endsem,
    }.withoutNulls,
  );

  return firestoreData;
}

class ExamRecordDocumentEquality implements Equality<ExamRecord> {
  const ExamRecordDocumentEquality();

  @override
  bool equals(ExamRecord? e1, ExamRecord? e2) {
    return e1?.minor1 == e2?.minor1 &&
        e1?.minor2 == e2?.minor2 &&
        e1?.midsem == e2?.midsem &&
        e1?.endsem == e2?.endsem;
  }

  @override
  int hash(ExamRecord? e) =>
      const ListEquality().hash([e?.minor1, e?.minor2, e?.midsem, e?.endsem]);

  @override
  bool isValidKey(Object? o) => o is ExamRecord;
}
