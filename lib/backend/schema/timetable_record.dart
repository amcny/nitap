import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';

class TimetableRecord extends FirestoreRecord {
  TimetableRecord._(
    super.reference,
    super.data,
  ) {
    _initializeFields();
  }

  // "day" field.
  String? _day;
  String get day => _day ?? '';
  bool hasDay() => _day != null;

  // "data" field.
  List<TimetableStruct>? _data;
  List<TimetableStruct> get data => _data ?? const [];
  bool hasData() => _data != null;

  // "secname" field.
  String? _secname;
  String get secname => _secname ?? '';
  bool hasSecname() => _secname != null;

  void _initializeFields() {
    _day = snapshotData['day'] as String?;
    _data = getStructList(
      snapshotData['data'],
      TimetableStruct.fromMap,
    );
    _secname = snapshotData['secname'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('timetable');

  static Stream<TimetableRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TimetableRecord.fromSnapshot(s));

  static Future<TimetableRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TimetableRecord.fromSnapshot(s));

  static TimetableRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TimetableRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TimetableRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TimetableRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TimetableRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TimetableRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTimetableRecordData({
  String? day,
  String? secname,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'day': day,
      'secname': secname,
    }.withoutNulls,
  );

  return firestoreData;
}

class TimetableRecordDocumentEquality implements Equality<TimetableRecord> {
  const TimetableRecordDocumentEquality();

  @override
  bool equals(TimetableRecord? e1, TimetableRecord? e2) {
    const listEquality = ListEquality();
    return e1?.day == e2?.day &&
        listEquality.equals(e1?.data, e2?.data) &&
        e1?.secname == e2?.secname;
  }

  @override
  int hash(TimetableRecord? e) =>
      const ListEquality().hash([e?.day, e?.data, e?.secname]);

  @override
  bool isValidKey(Object? o) => o is TimetableRecord;
}
