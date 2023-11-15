import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class ForyouRecord extends FirestoreRecord {
  ForyouRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "Title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "Description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "order" field.
  int? _order;
  int get order => _order ?? 0;
  bool hasOrder() => _order != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  void _initializeFields() {
    _image = snapshotData['image'] as String?;
    _title = snapshotData['Title'] as String?;
    _description = snapshotData['Description'] as String?;
    _order = castToType<int>(snapshotData['order']);
    _url = snapshotData['url'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('foryou');

  static Stream<ForyouRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ForyouRecord.fromSnapshot(s));

  static Future<ForyouRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ForyouRecord.fromSnapshot(s));

  static ForyouRecord fromSnapshot(DocumentSnapshot snapshot) => ForyouRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ForyouRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ForyouRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ForyouRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ForyouRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createForyouRecordData({
  String? image,
  String? title,
  String? description,
  int? order,
  String? url,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'image': image,
      'Title': title,
      'Description': description,
      'order': order,
      'url': url,
    }.withoutNulls,
  );

  return firestoreData;
}

class ForyouRecordDocumentEquality implements Equality<ForyouRecord> {
  const ForyouRecordDocumentEquality();

  @override
  bool equals(ForyouRecord? e1, ForyouRecord? e2) {
    return e1?.image == e2?.image &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.order == e2?.order &&
        e1?.url == e2?.url;
  }

  @override
  int hash(ForyouRecord? e) => const ListEquality()
      .hash([e?.image, e?.title, e?.description, e?.order, e?.url]);

  @override
  bool isValidKey(Object? o) => o is ForyouRecord;
}
