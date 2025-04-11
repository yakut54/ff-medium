// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class EquiringKeysStruct extends FFFirebaseStruct {
  EquiringKeysStruct({
    CloudpaymentsKeysStruct? cloudpayments,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _cloudpayments = cloudpayments,
        super(firestoreUtilData);

  // "cloudpayments" field.
  CloudpaymentsKeysStruct? _cloudpayments;
  CloudpaymentsKeysStruct get cloudpayments =>
      _cloudpayments ?? CloudpaymentsKeysStruct();
  set cloudpayments(CloudpaymentsKeysStruct? val) => _cloudpayments = val;

  void updateCloudpayments(Function(CloudpaymentsKeysStruct) updateFn) {
    updateFn(_cloudpayments ??= CloudpaymentsKeysStruct());
  }

  bool hasCloudpayments() => _cloudpayments != null;

  static EquiringKeysStruct fromMap(Map<String, dynamic> data) =>
      EquiringKeysStruct(
        cloudpayments: data['cloudpayments'] is CloudpaymentsKeysStruct
            ? data['cloudpayments']
            : CloudpaymentsKeysStruct.maybeFromMap(data['cloudpayments']),
      );

  static EquiringKeysStruct? maybeFromMap(dynamic data) => data is Map
      ? EquiringKeysStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'cloudpayments': _cloudpayments?.toMap(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'cloudpayments': serializeParam(
          _cloudpayments,
          ParamType.DataStruct,
        ),
      }.withoutNulls;

  static EquiringKeysStruct fromSerializableMap(Map<String, dynamic> data) =>
      EquiringKeysStruct(
        cloudpayments: deserializeStructParam(
          data['cloudpayments'],
          ParamType.DataStruct,
          false,
          structBuilder: CloudpaymentsKeysStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'EquiringKeysStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is EquiringKeysStruct && cloudpayments == other.cloudpayments;
  }

  @override
  int get hashCode => const ListEquality().hash([cloudpayments]);
}

EquiringKeysStruct createEquiringKeysStruct({
  CloudpaymentsKeysStruct? cloudpayments,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    EquiringKeysStruct(
      cloudpayments: cloudpayments ??
          (clearUnsetFields ? CloudpaymentsKeysStruct() : null),
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

EquiringKeysStruct? updateEquiringKeysStruct(
  EquiringKeysStruct? equiringKeys, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    equiringKeys
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addEquiringKeysStructData(
  Map<String, dynamic> firestoreData,
  EquiringKeysStruct? equiringKeys,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (equiringKeys == null) {
    return;
  }
  if (equiringKeys.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && equiringKeys.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final equiringKeysData =
      getEquiringKeysFirestoreData(equiringKeys, forFieldValue);
  final nestedData =
      equiringKeysData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = equiringKeys.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getEquiringKeysFirestoreData(
  EquiringKeysStruct? equiringKeys, [
  bool forFieldValue = false,
]) {
  if (equiringKeys == null) {
    return {};
  }
  final firestoreData = mapToFirestore(equiringKeys.toMap());

  // Handle nested data for "cloudpayments" field.
  addCloudpaymentsKeysStructData(
    firestoreData,
    equiringKeys.hasCloudpayments() ? equiringKeys.cloudpayments : null,
    'cloudpayments',
    forFieldValue,
  );

  // Add any Firestore field values
  equiringKeys.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getEquiringKeysListFirestoreData(
  List<EquiringKeysStruct>? equiringKeyss,
) =>
    equiringKeyss?.map((e) => getEquiringKeysFirestoreData(e, true)).toList() ??
    [];
