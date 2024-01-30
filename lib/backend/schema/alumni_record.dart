import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class AlumniRecord extends FirestoreRecord {
  AlumniRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "batch" field.
  String? _batch;
  String get batch => _batch ?? '';
  bool hasBatch() => _batch != null;

  // "work" field.
  String? _work;
  String get work => _work ?? '';
  bool hasWork() => _work != null;

  // "linkedin" field.
  String? _linkedin;
  String get linkedin => _linkedin ?? '';
  bool hasLinkedin() => _linkedin != null;

  // "instagram" field.
  String? _instagram;
  String get instagram => _instagram ?? '';
  bool hasInstagram() => _instagram != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _name = snapshotData['name'] as String?;
    _batch = snapshotData['batch'] as String?;
    _work = snapshotData['work'] as String?;
    _linkedin = snapshotData['linkedin'] as String?;
    _instagram = snapshotData['instagram'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('alumni');

  static Stream<AlumniRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AlumniRecord.fromSnapshot(s));

  static Future<AlumniRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AlumniRecord.fromSnapshot(s));

  static AlumniRecord fromSnapshot(DocumentSnapshot snapshot) => AlumniRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AlumniRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AlumniRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AlumniRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AlumniRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAlumniRecordData({
  String? image,
  String? name,
  String? batch,
  String? work,
  String? linkedin,
  String? instagram,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'name': name,
      'batch': batch,
      'work': work,
      'linkedin': linkedin,
      'instagram': instagram,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class AlumniRecordDocumentEquality implements Equality<AlumniRecord> {
  const AlumniRecordDocumentEquality();

  @override
  bool equals(AlumniRecord? e1, AlumniRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.name == e2?.name &&
        e1?.batch == e2?.batch &&
        e1?.work == e2?.work &&
        e1?.linkedin == e2?.linkedin &&
        e1?.instagram == e2?.instagram &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(AlumniRecord? e) => const ListEquality().hash([
        e?.image,
        e?.name,
        e?.batch,
        e?.work,
        e?.linkedin,
        e?.instagram,
        e?.createdTime
      ]);

  @override
  bool isValidKey(Object? o) => o is AlumniRecord;
}
