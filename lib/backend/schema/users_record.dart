import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "role" field.
  Role? _role;
  Role? get role => _role;
  bool hasRole() => _role != null;

  // "is_authorized" field.
  bool? _isAuthorized;
  bool get isAuthorized => _isAuthorized ?? false;
  bool hasIsAuthorized() => _isAuthorized != null;

  // "onboarding_list" field.
  List<DocumentReference>? _onboardingList;
  List<DocumentReference> get onboardingList => _onboardingList ?? const [];
  bool hasOnboardingList() => _onboardingList != null;

  // "last_play" field.
  LastPlayStruct? _lastPlay;
  LastPlayStruct get lastPlay => _lastPlay ?? LastPlayStruct();
  bool hasLastPlay() => _lastPlay != null;

  // "udid" field.
  String? _udid;
  String get udid => _udid ?? '';
  bool hasUdid() => _udid != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "country_code" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  bool hasCountryCode() => _countryCode != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _role = snapshotData['role'] is Role
        ? snapshotData['role']
        : deserializeEnum<Role>(snapshotData['role']);
    _isAuthorized = snapshotData['is_authorized'] as bool?;
    _onboardingList = getDataList(snapshotData['onboarding_list']);
    _lastPlay = snapshotData['last_play'] is LastPlayStruct
        ? snapshotData['last_play']
        : LastPlayStruct.maybeFromMap(snapshotData['last_play']);
    _udid = snapshotData['udid'] as String?;
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _countryCode = snapshotData['country_code'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  Role? role,
  bool? isAuthorized,
  LastPlayStruct? lastPlay,
  String? udid,
  bool? isDeleted,
  String? countryCode,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'role': role,
      'is_authorized': isAuthorized,
      'last_play': LastPlayStruct().toMap(),
      'udid': udid,
      'is_deleted': isDeleted,
      'country_code': countryCode,
    }.withoutNulls,
  );

  // Handle nested data for "last_play" field.
  addLastPlayStructData(firestoreData, lastPlay, 'last_play');

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.role == e2?.role &&
        e1?.isAuthorized == e2?.isAuthorized &&
        listEquality.equals(e1?.onboardingList, e2?.onboardingList) &&
        e1?.lastPlay == e2?.lastPlay &&
        e1?.udid == e2?.udid &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.countryCode == e2?.countryCode;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.role,
        e?.isAuthorized,
        e?.onboardingList,
        e?.lastPlay,
        e?.udid,
        e?.isDeleted,
        e?.countryCode
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
