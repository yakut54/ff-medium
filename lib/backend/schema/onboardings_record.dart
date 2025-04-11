import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class OnboardingsRecord extends FirestoreRecord {
  OnboardingsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('onboardings');

  static Stream<OnboardingsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => OnboardingsRecord.fromSnapshot(s));

  static Future<OnboardingsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => OnboardingsRecord.fromSnapshot(s));

  static OnboardingsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      OnboardingsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static OnboardingsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      OnboardingsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'OnboardingsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is OnboardingsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createOnboardingsRecordData({
  String? name,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'is_deleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class OnboardingsRecordDocumentEquality implements Equality<OnboardingsRecord> {
  const OnboardingsRecordDocumentEquality();

  @override
  bool equals(OnboardingsRecord? e1, OnboardingsRecord? e2) {
    return e1?.name == e2?.name && e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(OnboardingsRecord? e) =>
      const ListEquality().hash([e?.name, e?.isDeleted]);

  @override
  bool isValidKey(Object? o) => o is OnboardingsRecord;
}
