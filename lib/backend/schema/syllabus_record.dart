import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SyllabusRecord extends FirestoreRecord {
  SyllabusRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "yearname" field.
  String? _yearname;
  String get yearname => _yearname ?? '';
  bool hasYearname() => _yearname != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _order = castToType<int>(snapshotData['order']);
    _yearname = snapshotData['yearname'] as String?;
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('syllabus');

  static Stream<SyllabusRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SyllabusRecord.fromSnapshot(s));

  static Future<SyllabusRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SyllabusRecord.fromSnapshot(s));

  static SyllabusRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SyllabusRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SyllabusRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SyllabusRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SyllabusRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SyllabusRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSyllabusRecordData({
  int? order,
  String? yearname,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'order': order,
      'yearname': yearname,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class SyllabusRecordDocumentEquality implements Equality<SyllabusRecord> {
  const SyllabusRecordDocumentEquality();

  @override
  bool equals(SyllabusRecord? e1, SyllabusRecord? e2) {
    return e1?.order == e2?.order &&
        e1?.yearname == e2?.yearname &&
        e1?.url == e2?.url;
  }

  @override
  int hash(SyllabusRecord? e) =>
      const ListEquality().hash([e?.order, e?.yearname, e?.url]);

  @override
  bool isValidKey(Object? o) => o is SyllabusRecord;
}
