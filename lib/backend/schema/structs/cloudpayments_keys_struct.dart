// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class CloudpaymentsKeysStruct extends FFFirebaseStruct {
  CloudpaymentsKeysStruct({
    String? publicId,
    String? password,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _publicId = publicId,
        _password = password,
        super(firestoreUtilData);

  // "public_id" field.
  String? _publicId;
  String get publicId => _publicId ?? '';
  set publicId(String? val) => _publicId = val;

  bool hasPublicId() => _publicId != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  static CloudpaymentsKeysStruct fromMap(Map<String, dynamic> data) =>
      CloudpaymentsKeysStruct(
        publicId: data['public_id'] as String?,
        password: data['password'] as String?,
      );

  static CloudpaymentsKeysStruct? maybeFromMap(dynamic data) => data is Map
      ? CloudpaymentsKeysStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'public_id': _publicId,
        'password': _password,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'public_id': serializeParam(
          _publicId,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
      }.withoutNulls;

  static CloudpaymentsKeysStruct fromSerializableMap(
          Map<String, dynamic> data) =>
      CloudpaymentsKeysStruct(
        publicId: deserializeParam(
          data['public_id'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CloudpaymentsKeysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CloudpaymentsKeysStruct &&
        publicId == other.publicId &&
        password == other.password;
  }

  @override
  int get hashCode => const ListEquality().hash([publicId, password]);
}

CloudpaymentsKeysStruct createCloudpaymentsKeysStruct({
  String? publicId,
  String? password,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    CloudpaymentsKeysStruct(
      publicId: publicId,
      password: password,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

CloudpaymentsKeysStruct? updateCloudpaymentsKeysStruct(
  CloudpaymentsKeysStruct? cloudpaymentsKeys, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    cloudpaymentsKeys
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addCloudpaymentsKeysStructData(
  Map<String, dynamic> firestoreData,
  CloudpaymentsKeysStruct? cloudpaymentsKeys,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (cloudpaymentsKeys == null) {
    return;
  }
  if (cloudpaymentsKeys.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && cloudpaymentsKeys.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final cloudpaymentsKeysData =
      getCloudpaymentsKeysFirestoreData(cloudpaymentsKeys, forFieldValue);
  final nestedData =
      cloudpaymentsKeysData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = cloudpaymentsKeys.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getCloudpaymentsKeysFirestoreData(
  CloudpaymentsKeysStruct? cloudpaymentsKeys, [
  bool forFieldValue = false,
]) {
  if (cloudpaymentsKeys == null) {
    return {};
  }
  final firestoreData = mapToFirestore(cloudpaymentsKeys.toMap());

  // Add any Firestore field values
  cloudpaymentsKeys.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getCloudpaymentsKeysListFirestoreData(
  List<CloudpaymentsKeysStruct>? cloudpaymentsKeyss,
) =>
    cloudpaymentsKeyss
        ?.map((e) => getCloudpaymentsKeysFirestoreData(e, true))
        .toList() ??
    [];
