import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SubscriptionsRecord extends FirestoreRecord {
  SubscriptionsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "status" field.
  Tier? _status;
  Tier? get status => _status;
  bool hasStatus() => _status != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "subscription_end_time" field.
  DateTime? _subscriptionEndTime;
  DateTime? get subscriptionEndTime => _subscriptionEndTime;
  bool hasSubscriptionEndTime() => _subscriptionEndTime != null;

  // "subscription_id" field.
  String? _subscriptionId;
  String get subscriptionId => _subscriptionId ?? '';
  bool hasSubscriptionId() => _subscriptionId != null;

  // "subscription_index" field.
  int? _subscriptionIndex;
  int get subscriptionIndex => _subscriptionIndex ?? 0;
  bool hasSubscriptionIndex() => _subscriptionIndex != null;

  void _initializeFields() {
    _status = snapshotData['status'] is Tier
        ? snapshotData['status']
        : deserializeEnum<Tier>(snapshotData['status']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _subscriptionEndTime = snapshotData['subscription_end_time'] as DateTime?;
    _subscriptionId = snapshotData['subscription_id'] as String?;
    _subscriptionIndex = castToType<int>(snapshotData['subscription_index']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('subscriptions');

  static Stream<SubscriptionsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => SubscriptionsRecord.fromSnapshot(s));

  static Future<SubscriptionsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => SubscriptionsRecord.fromSnapshot(s));

  static SubscriptionsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      SubscriptionsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static SubscriptionsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      SubscriptionsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'SubscriptionsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is SubscriptionsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createSubscriptionsRecordData({
  Tier? status,
  DateTime? createdTime,
  DateTime? subscriptionEndTime,
  String? subscriptionId,
  int? subscriptionIndex,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'status': status,
      'created_time': createdTime,
      'subscription_end_time': subscriptionEndTime,
      'subscription_id': subscriptionId,
      'subscription_index': subscriptionIndex,
    }.withoutNulls,
  );

  return firestoreData;
}

class SubscriptionsRecordDocumentEquality
    implements Equality<SubscriptionsRecord> {
  const SubscriptionsRecordDocumentEquality();

  @override
  bool equals(SubscriptionsRecord? e1, SubscriptionsRecord? e2) {
    return e1?.status == e2?.status &&
        e1?.createdTime == e2?.createdTime &&
        e1?.subscriptionEndTime == e2?.subscriptionEndTime &&
        e1?.subscriptionId == e2?.subscriptionId &&
        e1?.subscriptionIndex == e2?.subscriptionIndex;
  }

  @override
  int hash(SubscriptionsRecord? e) => const ListEquality().hash([
        e?.status,
        e?.createdTime,
        e?.subscriptionEndTime,
        e?.subscriptionId,
        e?.subscriptionIndex
      ]);

  @override
  bool isValidKey(Object? o) => o is SubscriptionsRecord;
}
