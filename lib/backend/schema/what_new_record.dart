import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class WhatNewRecord extends FirestoreRecord {
  WhatNewRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "type" field.
  String? _type;
  String get type => _type ?? '';
  bool hasType() => _type != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  bool hasImage() => _image != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _type = snapshotData['type'] as String?;
    _title = snapshotData['title'] as String?;
    _description = snapshotData['description'] as String?;
    _image = snapshotData['image'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('what_new');

  static Stream<WhatNewRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => WhatNewRecord.fromSnapshot(s));

  static Future<WhatNewRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => WhatNewRecord.fromSnapshot(s));

  static WhatNewRecord fromSnapshot(DocumentSnapshot snapshot) =>
      WhatNewRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static WhatNewRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      WhatNewRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'WhatNewRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is WhatNewRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createWhatNewRecordData({
  String? type,
  String? title,
  String? description,
  String? image,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'type': type,
      'title': title,
      'description': description,
      'image': image,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class WhatNewRecordDocumentEquality implements Equality<WhatNewRecord> {
  const WhatNewRecordDocumentEquality();

  @override
  bool equals(WhatNewRecord? e1, WhatNewRecord? e2) {
    return e1?.type == e2?.type &&
        e1?.title == e2?.title &&
        e1?.description == e2?.description &&
        e1?.image == e2?.image &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(WhatNewRecord? e) => const ListEquality()
      .hash([e?.type, e?.title, e?.description, e?.image, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is WhatNewRecord;
}
