import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AcademicRecord extends FirestoreRecord {
  AcademicRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('academic');

  static Stream<AcademicRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AcademicRecord.fromSnapshot(s));

  static Future<AcademicRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AcademicRecord.fromSnapshot(s));

  static AcademicRecord fromSnapshot(DocumentSnapshot snapshot) =>
      AcademicRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AcademicRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AcademicRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AcademicRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AcademicRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAcademicRecordData({
  String? image,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AcademicRecordDocumentEquality implements Equality<AcademicRecord> {
  const AcademicRecordDocumentEquality();

  @override
  bool equals(AcademicRecord? e1, AcademicRecord? e2) {
    return e1?.image == e2?.image && e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(AcademicRecord? e) =>
      const ListEquality().hash([e?.image, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is AcademicRecord;
}
