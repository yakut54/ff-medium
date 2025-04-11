// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class TinkoffKeysStruct extends FFFirebaseStruct {
  TinkoffKeysStruct({
    String? terminalKey,
    String? password,
    String? publicKey,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _terminalKey = terminalKey,
        _password = password,
        _publicKey = publicKey,
        super(firestoreUtilData);

  // "terminalKey" field.
  String? _terminalKey;
  String get terminalKey => _terminalKey ?? '';
  set terminalKey(String? val) => _terminalKey = val;

  bool hasTerminalKey() => _terminalKey != null;

  // "password" field.
  String? _password;
  String get password => _password ?? '';
  set password(String? val) => _password = val;

  bool hasPassword() => _password != null;

  // "publicKey" field.
  String? _publicKey;
  String get publicKey => _publicKey ?? '';
  set publicKey(String? val) => _publicKey = val;

  bool hasPublicKey() => _publicKey != null;

  static TinkoffKeysStruct fromMap(Map<String, dynamic> data) =>
      TinkoffKeysStruct(
        terminalKey: data['terminalKey'] as String?,
        password: data['password'] as String?,
        publicKey: data['publicKey'] as String?,
      );

  static TinkoffKeysStruct? maybeFromMap(dynamic data) => data is Map
      ? TinkoffKeysStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'terminalKey': _terminalKey,
        'password': _password,
        'publicKey': _publicKey,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'terminalKey': serializeParam(
          _terminalKey,
          ParamType.String,
        ),
        'password': serializeParam(
          _password,
          ParamType.String,
        ),
        'publicKey': serializeParam(
          _publicKey,
          ParamType.String,
        ),
      }.withoutNulls;

  static TinkoffKeysStruct fromSerializableMap(Map<String, dynamic> data) =>
      TinkoffKeysStruct(
        terminalKey: deserializeParam(
          data['terminalKey'],
          ParamType.String,
          false,
        ),
        password: deserializeParam(
          data['password'],
          ParamType.String,
          false,
        ),
        publicKey: deserializeParam(
          data['publicKey'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'TinkoffKeysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TinkoffKeysStruct &&
        terminalKey == other.terminalKey &&
        password == other.password &&
        publicKey == other.publicKey;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([terminalKey, password, publicKey]);
}

TinkoffKeysStruct createTinkoffKeysStruct({
  String? terminalKey,
  String? password,
  String? publicKey,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TinkoffKeysStruct(
      terminalKey: terminalKey,
      password: password,
      publicKey: publicKey,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TinkoffKeysStruct? updateTinkoffKeysStruct(
  TinkoffKeysStruct? tinkoffKeys, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tinkoffKeys
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTinkoffKeysStructData(
  Map<String, dynamic> firestoreData,
  TinkoffKeysStruct? tinkoffKeys,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tinkoffKeys == null) {
    return;
  }
  if (tinkoffKeys.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tinkoffKeys.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tinkoffKeysData =
      getTinkoffKeysFirestoreData(tinkoffKeys, forFieldValue);
  final nestedData =
      tinkoffKeysData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tinkoffKeys.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTinkoffKeysFirestoreData(
  TinkoffKeysStruct? tinkoffKeys, [
  bool forFieldValue = false,
]) {
  if (tinkoffKeys == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tinkoffKeys.toMap());

  // Add any Firestore field values
  tinkoffKeys.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTinkoffKeysListFirestoreData(
  List<TinkoffKeysStruct>? tinkoffKeyss,
) =>
    tinkoffKeyss?.map((e) => getTinkoffKeysFirestoreData(e, true)).toList() ??
    [];
