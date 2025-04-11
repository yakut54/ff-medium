// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class AgreementsStruct extends FFFirebaseStruct {
  AgreementsStruct({
    String? item,
    String? text,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _item = item,
        _text = text,
        super(firestoreUtilData);

  // "item" field.
  String? _item;
  String get item => _item ?? '';
  set item(String? val) => _item = val;

  bool hasItem() => _item != null;

  // "text" field.
  String? _text;
  String get text => _text ?? '';
  set text(String? val) => _text = val;

  bool hasText() => _text != null;

  static AgreementsStruct fromMap(Map<String, dynamic> data) =>
      AgreementsStruct(
        item: data['item'] as String?,
        text: data['text'] as String?,
      );

  static AgreementsStruct? maybeFromMap(dynamic data) => data is Map
      ? AgreementsStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'item': _item,
        'text': _text,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'item': serializeParam(
          _item,
          ParamType.String,
        ),
        'text': serializeParam(
          _text,
          ParamType.String,
        ),
      }.withoutNulls;

  static AgreementsStruct fromSerializableMap(Map<String, dynamic> data) =>
      AgreementsStruct(
        item: deserializeParam(
          data['item'],
          ParamType.String,
          false,
        ),
        text: deserializeParam(
          data['text'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'AgreementsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AgreementsStruct &&
        item == other.item &&
        text == other.text;
  }

  @override
  int get hashCode => const ListEquality().hash([item, text]);
}

AgreementsStruct createAgreementsStruct({
  String? item,
  String? text,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    AgreementsStruct(
      item: item,
      text: text,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

AgreementsStruct? updateAgreementsStruct(
  AgreementsStruct? agreements, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    agreements
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addAgreementsStructData(
  Map<String, dynamic> firestoreData,
  AgreementsStruct? agreements,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (agreements == null) {
    return;
  }
  if (agreements.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && agreements.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final agreementsData = getAgreementsFirestoreData(agreements, forFieldValue);
  final nestedData = agreementsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = agreements.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getAgreementsFirestoreData(
  AgreementsStruct? agreements, [
  bool forFieldValue = false,
]) {
  if (agreements == null) {
    return {};
  }
  final firestoreData = mapToFirestore(agreements.toMap());

  // Add any Firestore field values
  agreements.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getAgreementsListFirestoreData(
  List<AgreementsStruct>? agreementss,
) =>
    agreementss?.map((e) => getAgreementsFirestoreData(e, true)).toList() ?? [];
