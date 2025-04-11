// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';

import '/flutter_flow/flutter_flow_util.dart';

class DeviceInfoStruct extends FFFirebaseStruct {
  DeviceInfoStruct({
    double? height,
    double? width,
    String? appVersion,
    String? appBuildNumber,
    String? appPackageName,
    String? udid,
    String? countryCode,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _height = height,
        _width = width,
        _appVersion = appVersion,
        _appBuildNumber = appBuildNumber,
        _appPackageName = appPackageName,
        _udid = udid,
        _countryCode = countryCode,
        super(firestoreUtilData);

  // "height" field.
  double? _height;
  double get height => _height ?? 0.0;
  set height(double? val) => _height = val;

  void incrementHeight(double amount) => height = height + amount;

  bool hasHeight() => _height != null;

  // "width" field.
  double? _width;
  double get width => _width ?? 0.0;
  set width(double? val) => _width = val;

  void incrementWidth(double amount) => width = width + amount;

  bool hasWidth() => _width != null;

  // "appVersion" field.
  String? _appVersion;
  String get appVersion => _appVersion ?? '';
  set appVersion(String? val) => _appVersion = val;

  bool hasAppVersion() => _appVersion != null;

  // "appBuildNumber" field.
  String? _appBuildNumber;
  String get appBuildNumber => _appBuildNumber ?? '';
  set appBuildNumber(String? val) => _appBuildNumber = val;

  bool hasAppBuildNumber() => _appBuildNumber != null;

  // "appPackageName" field.
  String? _appPackageName;
  String get appPackageName => _appPackageName ?? '';
  set appPackageName(String? val) => _appPackageName = val;

  bool hasAppPackageName() => _appPackageName != null;

  // "udid" field.
  String? _udid;
  String get udid => _udid ?? '';
  set udid(String? val) => _udid = val;

  bool hasUdid() => _udid != null;

  // "countryCode" field.
  String? _countryCode;
  String get countryCode => _countryCode ?? '';
  set countryCode(String? val) => _countryCode = val;

  bool hasCountryCode() => _countryCode != null;

  static DeviceInfoStruct fromMap(Map<String, dynamic> data) =>
      DeviceInfoStruct(
        height: castToType<double>(data['height']),
        width: castToType<double>(data['width']),
        appVersion: data['appVersion'] as String?,
        appBuildNumber: data['appBuildNumber'] as String?,
        appPackageName: data['appPackageName'] as String?,
        udid: data['udid'] as String?,
        countryCode: data['countryCode'] as String?,
      );

  static DeviceInfoStruct? maybeFromMap(dynamic data) => data is Map
      ? DeviceInfoStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'height': _height,
        'width': _width,
        'appVersion': _appVersion,
        'appBuildNumber': _appBuildNumber,
        'appPackageName': _appPackageName,
        'udid': _udid,
        'countryCode': _countryCode,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'height': serializeParam(
          _height,
          ParamType.double,
        ),
        'width': serializeParam(
          _width,
          ParamType.double,
        ),
        'appVersion': serializeParam(
          _appVersion,
          ParamType.String,
        ),
        'appBuildNumber': serializeParam(
          _appBuildNumber,
          ParamType.String,
        ),
        'appPackageName': serializeParam(
          _appPackageName,
          ParamType.String,
        ),
        'udid': serializeParam(
          _udid,
          ParamType.String,
        ),
        'countryCode': serializeParam(
          _countryCode,
          ParamType.String,
        ),
      }.withoutNulls;

  static DeviceInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      DeviceInfoStruct(
        height: deserializeParam(
          data['height'],
          ParamType.double,
          false,
        ),
        width: deserializeParam(
          data['width'],
          ParamType.double,
          false,
        ),
        appVersion: deserializeParam(
          data['appVersion'],
          ParamType.String,
          false,
        ),
        appBuildNumber: deserializeParam(
          data['appBuildNumber'],
          ParamType.String,
          false,
        ),
        appPackageName: deserializeParam(
          data['appPackageName'],
          ParamType.String,
          false,
        ),
        udid: deserializeParam(
          data['udid'],
          ParamType.String,
          false,
        ),
        countryCode: deserializeParam(
          data['countryCode'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'DeviceInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is DeviceInfoStruct &&
        height == other.height &&
        width == other.width &&
        appVersion == other.appVersion &&
        appBuildNumber == other.appBuildNumber &&
        appPackageName == other.appPackageName &&
        udid == other.udid &&
        countryCode == other.countryCode;
  }

  @override
  int get hashCode => const ListEquality().hash([
        height,
        width,
        appVersion,
        appBuildNumber,
        appPackageName,
        udid,
        countryCode
      ]);
}

DeviceInfoStruct createDeviceInfoStruct({
  double? height,
  double? width,
  String? appVersion,
  String? appBuildNumber,
  String? appPackageName,
  String? udid,
  String? countryCode,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    DeviceInfoStruct(
      height: height,
      width: width,
      appVersion: appVersion,
      appBuildNumber: appBuildNumber,
      appPackageName: appPackageName,
      udid: udid,
      countryCode: countryCode,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

DeviceInfoStruct? updateDeviceInfoStruct(
  DeviceInfoStruct? deviceInfo, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    deviceInfo
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addDeviceInfoStructData(
  Map<String, dynamic> firestoreData,
  DeviceInfoStruct? deviceInfo,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (deviceInfo == null) {
    return;
  }
  if (deviceInfo.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && deviceInfo.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final deviceInfoData = getDeviceInfoFirestoreData(deviceInfo, forFieldValue);
  final nestedData = deviceInfoData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = deviceInfo.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getDeviceInfoFirestoreData(
  DeviceInfoStruct? deviceInfo, [
  bool forFieldValue = false,
]) {
  if (deviceInfo == null) {
    return {};
  }
  final firestoreData = mapToFirestore(deviceInfo.toMap());

  // Add any Firestore field values
  deviceInfo.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getDeviceInfoListFirestoreData(
  List<DeviceInfoStruct>? deviceInfos,
) =>
    deviceInfos?.map((e) => getDeviceInfoFirestoreData(e, true)).toList() ?? [];
