// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LastPlayStruct extends FFFirebaseStruct {
  LastPlayStruct({
    DocumentType? documentType,
    String? id,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _documentType = documentType,
        _id = id,
        super(firestoreUtilData);

  // "documentType" field.
  DocumentType? _documentType;
  DocumentType? get documentType => _documentType;
  set documentType(DocumentType? val) => _documentType = val;

  bool hasDocumentType() => _documentType != null;

  // "id" field.
  String? _id;
  String get id => _id ?? '';
  set id(String? val) => _id = val;

  bool hasId() => _id != null;

  static LastPlayStruct fromMap(Map<String, dynamic> data) => LastPlayStruct(
        documentType: data['documentType'] is DocumentType
            ? data['documentType']
            : deserializeEnum<DocumentType>(data['documentType']),
        id: data['id'] as String?,
      );

  static LastPlayStruct? maybeFromMap(dynamic data) =>
      data is Map ? LastPlayStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'documentType': _documentType?.serialize(),
        'id': _id,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'documentType': serializeParam(
          _documentType,
          ParamType.Enum,
        ),
        'id': serializeParam(
          _id,
          ParamType.String,
        ),
      }.withoutNulls;

  static LastPlayStruct fromSerializableMap(Map<String, dynamic> data) =>
      LastPlayStruct(
        documentType: deserializeParam<DocumentType>(
          data['documentType'],
          ParamType.Enum,
          false,
        ),
        id: deserializeParam(
          data['id'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'LastPlayStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LastPlayStruct &&
        documentType == other.documentType &&
        id == other.id;
  }

  @override
  int get hashCode => const ListEquality().hash([documentType, id]);
}

LastPlayStruct createLastPlayStruct({
  DocumentType? documentType,
  String? id,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LastPlayStruct(
      documentType: documentType,
      id: id,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LastPlayStruct? updateLastPlayStruct(
  LastPlayStruct? lastPlay, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lastPlay
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLastPlayStructData(
  Map<String, dynamic> firestoreData,
  LastPlayStruct? lastPlay,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lastPlay == null) {
    return;
  }
  if (lastPlay.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lastPlay.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lastPlayData = getLastPlayFirestoreData(lastPlay, forFieldValue);
  final nestedData = lastPlayData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lastPlay.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLastPlayFirestoreData(
  LastPlayStruct? lastPlay, [
  bool forFieldValue = false,
]) {
  if (lastPlay == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lastPlay.toMap());

  // Add any Firestore field values
  lastPlay.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLastPlayListFirestoreData(
  List<LastPlayStruct>? lastPlays,
) =>
    lastPlays?.map((e) => getLastPlayFirestoreData(e, true)).toList() ?? [];
