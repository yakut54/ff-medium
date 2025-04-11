// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LessonStruct extends FFFirebaseStruct {
  LessonStruct({
    String? name,
    String? doc,
    String? audio,
    String? video,
    int? duration,
    List<DocumentReference>? views,
    bool? isAdditional,
    int? pages,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _doc = doc,
        _audio = audio,
        _video = video,
        _duration = duration,
        _views = views,
        _isAdditional = isAdditional,
        _pages = pages,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "doc" field.
  String? _doc;
  String get doc => _doc ?? '';
  set doc(String? val) => _doc = val;

  bool hasDoc() => _doc != null;

  // "audio" field.
  String? _audio;
  String get audio => _audio ?? '';
  set audio(String? val) => _audio = val;

  bool hasAudio() => _audio != null;

  // "video" field.
  String? _video;
  String get video => _video ?? '';
  set video(String? val) => _video = val;

  bool hasVideo() => _video != null;

  // "duration" field.
  int? _duration;
  int get duration => _duration ?? 0;
  set duration(int? val) => _duration = val;

  void incrementDuration(int amount) => duration = duration + amount;

  bool hasDuration() => _duration != null;

  // "views" field.
  List<DocumentReference>? _views;
  List<DocumentReference> get views => _views ?? const [];
  set views(List<DocumentReference>? val) => _views = val;

  void updateViews(Function(List<DocumentReference>) updateFn) {
    updateFn(_views ??= []);
  }

  bool hasViews() => _views != null;

  // "is_additional" field.
  bool? _isAdditional;
  bool get isAdditional => _isAdditional ?? false;
  set isAdditional(bool? val) => _isAdditional = val;

  bool hasIsAdditional() => _isAdditional != null;

  // "pages" field.
  int? _pages;
  int get pages => _pages ?? 0;
  set pages(int? val) => _pages = val;

  void incrementPages(int amount) => pages = pages + amount;

  bool hasPages() => _pages != null;

  static LessonStruct fromMap(Map<String, dynamic> data) => LessonStruct(
        name: data['name'] as String?,
        doc: data['doc'] as String?,
        audio: data['audio'] as String?,
        video: data['video'] as String?,
        duration: castToType<int>(data['duration']),
        views: getDataList(data['views']),
        isAdditional: data['is_additional'] as bool?,
        pages: castToType<int>(data['pages']),
      );

  static LessonStruct? maybeFromMap(dynamic data) =>
      data is Map ? LessonStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'doc': _doc,
        'audio': _audio,
        'video': _video,
        'duration': _duration,
        'views': _views,
        'is_additional': _isAdditional,
        'pages': _pages,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'doc': serializeParam(
          _doc,
          ParamType.String,
        ),
        'audio': serializeParam(
          _audio,
          ParamType.String,
        ),
        'video': serializeParam(
          _video,
          ParamType.String,
        ),
        'duration': serializeParam(
          _duration,
          ParamType.int,
        ),
        'views': serializeParam(
          _views,
          ParamType.DocumentReference,
          isList: true,
        ),
        'is_additional': serializeParam(
          _isAdditional,
          ParamType.bool,
        ),
        'pages': serializeParam(
          _pages,
          ParamType.int,
        ),
      }.withoutNulls;

  static LessonStruct fromSerializableMap(Map<String, dynamic> data) =>
      LessonStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        doc: deserializeParam(
          data['doc'],
          ParamType.String,
          false,
        ),
        audio: deserializeParam(
          data['audio'],
          ParamType.String,
          false,
        ),
        video: deserializeParam(
          data['video'],
          ParamType.String,
          false,
        ),
        duration: deserializeParam(
          data['duration'],
          ParamType.int,
          false,
        ),
        views: deserializeParam<DocumentReference>(
          data['views'],
          ParamType.DocumentReference,
          true,
          collectionNamePath: ['users'],
        ),
        isAdditional: deserializeParam(
          data['is_additional'],
          ParamType.bool,
          false,
        ),
        pages: deserializeParam(
          data['pages'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LessonStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is LessonStruct &&
        name == other.name &&
        doc == other.doc &&
        audio == other.audio &&
        video == other.video &&
        duration == other.duration &&
        listEquality.equals(views, other.views) &&
        isAdditional == other.isAdditional &&
        pages == other.pages;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([name, doc, audio, video, duration, views, isAdditional, pages]);
}

LessonStruct createLessonStruct({
  String? name,
  String? doc,
  String? audio,
  String? video,
  int? duration,
  bool? isAdditional,
  int? pages,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    LessonStruct(
      name: name,
      doc: doc,
      audio: audio,
      video: video,
      duration: duration,
      isAdditional: isAdditional,
      pages: pages,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

LessonStruct? updateLessonStruct(
  LessonStruct? lesson, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    lesson
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addLessonStructData(
  Map<String, dynamic> firestoreData,
  LessonStruct? lesson,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (lesson == null) {
    return;
  }
  if (lesson.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && lesson.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final lessonData = getLessonFirestoreData(lesson, forFieldValue);
  final nestedData = lessonData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = lesson.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getLessonFirestoreData(
  LessonStruct? lesson, [
  bool forFieldValue = false,
]) {
  if (lesson == null) {
    return {};
  }
  final firestoreData = mapToFirestore(lesson.toMap());

  // Add any Firestore field values
  lesson.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getLessonListFirestoreData(
  List<LessonStruct>? lessons,
) =>
    lessons?.map((e) => getLessonFirestoreData(e, true)).toList() ?? [];
