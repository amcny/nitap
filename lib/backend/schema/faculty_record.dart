import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class FacultyRecord extends FirestoreRecord {
  FacultyRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "deptname" field.
  String? _deptname;
  String get deptname => _deptname ?? '';
  bool hasDeptname() => _deptname != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "room" field.
  String? _room;
  String get room => _room ?? '';
  bool hasRoom() => _room != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _deptname = snapshotData['deptname'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _url = snapshotData['url'] as String?;
    _room = snapshotData['room'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('faculty');

  static Stream<FacultyRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FacultyRecord.fromSnapshot(s));

  static Future<FacultyRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FacultyRecord.fromSnapshot(s));

  static FacultyRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FacultyRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FacultyRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FacultyRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FacultyRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FacultyRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFacultyRecordData({
  String? image,
  String? deptname,
  int? order,
  String? url,
  String? room,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'deptname': deptname,
      'order': order,
      'url': url,
      'room': room,
    }.withoutNulls,
  );

  return firestoreData;
}

class FacultyRecordDocumentEquality implements Equality<FacultyRecord> {
  const FacultyRecordDocumentEquality();

  @override
  bool equals(FacultyRecord? e1, FacultyRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.deptname == e2?.deptname &&
        e1?.order == e2?.order &&
        e1?.url == e2?.url &&
        e1?.room == e2?.room;
  }

  @override
  int hash(FacultyRecord? e) => const ListEquality()
      .hash([e?.image, e?.deptname, e?.order, e?.url, e?.room]);

  @override
  bool isValidKey(Object? o) => o is FacultyRecord;
}
