import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AppRecord extends FirestoreRecord {
  AppRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "tiers" field.
  List<TierStruct>? _tiers;
  List<TierStruct> get tiers => _tiers ?? const [];
  bool hasTiers() => _tiers != null;

  // "keys" field.
  EquiringKeysStruct? _keys;
  EquiringKeysStruct get keys => _keys ?? EquiringKeysStruct();
  bool hasKeys() => _keys != null;

  // "guest_tier" field.
  TierStruct? _guestTier;
  TierStruct get guestTier => _guestTier ?? TierStruct();
  bool hasGuestTier() => _guestTier != null;

  void _initializeFields() {
    _tiers = getStructList(
      snapshotData['tiers'],
      TierStruct.fromMap,
    );
    _keys = snapshotData['keys'] is EquiringKeysStruct
        ? snapshotData['keys']
        : EquiringKeysStruct.maybeFromMap(snapshotData['keys']);
    _guestTier = snapshotData['guest_tier'] is TierStruct
        ? snapshotData['guest_tier']
        : TierStruct.maybeFromMap(snapshotData['guest_tier']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('app');

  static Stream<AppRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => AppRecord.fromSnapshot(s));

  static Future<AppRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => AppRecord.fromSnapshot(s));

  static AppRecord fromSnapshot(DocumentSnapshot snapshot) => AppRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static AppRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      AppRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'AppRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is AppRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createAppRecordData({
  EquiringKeysStruct? keys,
  TierStruct? guestTier,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'keys': EquiringKeysStruct().toMap(),
      'guest_tier': TierStruct().toMap(),
    }.withoutNulls,
  );

  // Handle nested data for "keys" field.
  addEquiringKeysStructData(firestoreData, keys, 'keys');

  // Handle nested data for "guest_tier" field.
  addTierStructData(firestoreData, guestTier, 'guest_tier');

  return firestoreData;
}

class AppRecordDocumentEquality implements Equality<AppRecord> {
  const AppRecordDocumentEquality();

  @override
  bool equals(AppRecord? e1, AppRecord? e2) {
    const listEquality = ListEquality();
    return listEquality.equals(e1?.tiers, e2?.tiers) &&
        e1?.keys == e2?.keys &&
        e1?.guestTier == e2?.guestTier;
  }

  @override
  int hash(AppRecord? e) =>
      const ListEquality().hash([e?.tiers, e?.keys, e?.guestTier]);

  @override
  bool isValidKey(Object? o) => o is AppRecord;
}
