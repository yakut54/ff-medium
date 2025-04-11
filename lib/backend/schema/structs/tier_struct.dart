// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';
import '/backend/schema/enums/enums.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TierStruct extends FFFirebaseStruct {
  TierStruct({
    int? price,
    bool? isPrimary,
    int? period,
    String? url,
    String? bannerText,
    TierInterval? interval,
    String? name,
    int? initPrice,
    int? initPeriod,
    TierInterval? initInterval,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _price = price,
        _isPrimary = isPrimary,
        _period = period,
        _url = url,
        _bannerText = bannerText,
        _interval = interval,
        _name = name,
        _initPrice = initPrice,
        _initPeriod = initPeriod,
        _initInterval = initInterval,
        super(firestoreUtilData);

  // "price" field.
  int? _price;
  int get price => _price ?? 0;
  set price(int? val) => _price = val;

  void incrementPrice(int amount) => price = price + amount;

  bool hasPrice() => _price != null;

  // "is_primary" field.
  bool? _isPrimary;
  bool get isPrimary => _isPrimary ?? false;
  set isPrimary(bool? val) => _isPrimary = val;

  bool hasIsPrimary() => _isPrimary != null;

  // "period" field.
  int? _period;
  int get period => _period ?? 0;
  set period(int? val) => _period = val;

  void incrementPeriod(int amount) => period = period + amount;

  bool hasPeriod() => _period != null;

  // "url" field.
  String? _url;
  String get url => _url ?? '';
  set url(String? val) => _url = val;

  bool hasUrl() => _url != null;

  // "banner_text" field.
  String? _bannerText;
  String get bannerText => _bannerText ?? '';
  set bannerText(String? val) => _bannerText = val;

  bool hasBannerText() => _bannerText != null;

  // "interval" field.
  TierInterval? _interval;
  TierInterval? get interval => _interval;
  set interval(TierInterval? val) => _interval = val;

  bool hasInterval() => _interval != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "init_price" field.
  int? _initPrice;
  int get initPrice => _initPrice ?? 0;
  set initPrice(int? val) => _initPrice = val;

  void incrementInitPrice(int amount) => initPrice = initPrice + amount;

  bool hasInitPrice() => _initPrice != null;

  // "init_period" field.
  int? _initPeriod;
  int get initPeriod => _initPeriod ?? 0;
  set initPeriod(int? val) => _initPeriod = val;

  void incrementInitPeriod(int amount) => initPeriod = initPeriod + amount;

  bool hasInitPeriod() => _initPeriod != null;

  // "init_interval" field.
  TierInterval? _initInterval;
  TierInterval? get initInterval => _initInterval;
  set initInterval(TierInterval? val) => _initInterval = val;

  bool hasInitInterval() => _initInterval != null;

  static TierStruct fromMap(Map<String, dynamic> data) => TierStruct(
        price: castToType<int>(data['price']),
        isPrimary: data['is_primary'] as bool?,
        period: castToType<int>(data['period']),
        url: data['url'] as String?,
        bannerText: data['banner_text'] as String?,
        interval: data['interval'] is TierInterval
            ? data['interval']
            : deserializeEnum<TierInterval>(data['interval']),
        name: data['name'] as String?,
        initPrice: castToType<int>(data['init_price']),
        initPeriod: castToType<int>(data['init_period']),
        initInterval: data['init_interval'] is TierInterval
            ? data['init_interval']
            : deserializeEnum<TierInterval>(data['init_interval']),
      );

  static TierStruct? maybeFromMap(dynamic data) =>
      data is Map ? TierStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'price': _price,
        'is_primary': _isPrimary,
        'period': _period,
        'url': _url,
        'banner_text': _bannerText,
        'interval': _interval?.serialize(),
        'name': _name,
        'init_price': _initPrice,
        'init_period': _initPeriod,
        'init_interval': _initInterval?.serialize(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'price': serializeParam(
          _price,
          ParamType.int,
        ),
        'is_primary': serializeParam(
          _isPrimary,
          ParamType.bool,
        ),
        'period': serializeParam(
          _period,
          ParamType.int,
        ),
        'url': serializeParam(
          _url,
          ParamType.String,
        ),
        'banner_text': serializeParam(
          _bannerText,
          ParamType.String,
        ),
        'interval': serializeParam(
          _interval,
          ParamType.Enum,
        ),
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'init_price': serializeParam(
          _initPrice,
          ParamType.int,
        ),
        'init_period': serializeParam(
          _initPeriod,
          ParamType.int,
        ),
        'init_interval': serializeParam(
          _initInterval,
          ParamType.Enum,
        ),
      }.withoutNulls;

  static TierStruct fromSerializableMap(Map<String, dynamic> data) =>
      TierStruct(
        price: deserializeParam(
          data['price'],
          ParamType.int,
          false,
        ),
        isPrimary: deserializeParam(
          data['is_primary'],
          ParamType.bool,
          false,
        ),
        period: deserializeParam(
          data['period'],
          ParamType.int,
          false,
        ),
        url: deserializeParam(
          data['url'],
          ParamType.String,
          false,
        ),
        bannerText: deserializeParam(
          data['banner_text'],
          ParamType.String,
          false,
        ),
        interval: deserializeParam<TierInterval>(
          data['interval'],
          ParamType.Enum,
          false,
        ),
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        initPrice: deserializeParam(
          data['init_price'],
          ParamType.int,
          false,
        ),
        initPeriod: deserializeParam(
          data['init_period'],
          ParamType.int,
          false,
        ),
        initInterval: deserializeParam<TierInterval>(
          data['init_interval'],
          ParamType.Enum,
          false,
        ),
      );

  @override
  String toString() => 'TierStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TierStruct &&
        price == other.price &&
        isPrimary == other.isPrimary &&
        period == other.period &&
        url == other.url &&
        bannerText == other.bannerText &&
        interval == other.interval &&
        name == other.name &&
        initPrice == other.initPrice &&
        initPeriod == other.initPeriod &&
        initInterval == other.initInterval;
  }

  @override
  int get hashCode => const ListEquality().hash([
        price,
        isPrimary,
        period,
        url,
        bannerText,
        interval,
        name,
        initPrice,
        initPeriod,
        initInterval
      ]);
}

TierStruct createTierStruct({
  int? price,
  bool? isPrimary,
  int? period,
  String? url,
  String? bannerText,
  TierInterval? interval,
  String? name,
  int? initPrice,
  int? initPeriod,
  TierInterval? initInterval,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TierStruct(
      price: price,
      isPrimary: isPrimary,
      period: period,
      url: url,
      bannerText: bannerText,
      interval: interval,
      name: name,
      initPrice: initPrice,
      initPeriod: initPeriod,
      initInterval: initInterval,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TierStruct? updateTierStruct(
  TierStruct? tier, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tier
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTierStructData(
  Map<String, dynamic> firestoreData,
  TierStruct? tier,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tier == null) {
    return;
  }
  if (tier.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && tier.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tierData = getTierFirestoreData(tier, forFieldValue);
  final nestedData = tierData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tier.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTierFirestoreData(
  TierStruct? tier, [
  bool forFieldValue = false,
]) {
  if (tier == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tier.toMap());

  // Add any Firestore field values
  tier.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTierListFirestoreData(
  List<TierStruct>? tiers,
) =>
    tiers?.map((e) => getTierFirestoreData(e, true)).toList() ?? [];
