import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class HitsRecord extends FirestoreRecord {
  HitsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  bool hasUrl() => _url != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photo = snapshotData['photo'] as String?;
    _url = snapshotData['url'] as String?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _createdTime = snapshotData['created_time'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('hits');

  static Stream<HitsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => HitsRecord.fromSnapshot(s));

  static Future<HitsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => HitsRecord.fromSnapshot(s));

  static HitsRecord fromSnapshot(DocumentSnapshot snapshot) => HitsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static HitsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      HitsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'HitsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is HitsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createHitsRecordData({
  String? name,
  String? photo,
  String? url,
  DateTime? modifiedTime,
  DateTime? createdTime,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photo': photo,
      'url': url,
      'modified_time': modifiedTime,
      'created_time': createdTime,
    }.withoutNulls,
  );

  return firestoreData;
}

class HitsRecordDocumentEquality implements Equality<HitsRecord> {
  const HitsRecordDocumentEquality();

  @override
  bool equals(HitsRecord? e1, HitsRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.photo == e2?.photo &&
        e1?.url == e2?.url &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.createdTime == e2?.createdTime;
  }

  @override
  int hash(HitsRecord? e) => const ListEquality()
      .hash([e?.name, e?.photo, e?.url, e?.modifiedTime, e?.createdTime]);

  @override
  bool isValidKey(Object? o) => o is HitsRecord;
}
