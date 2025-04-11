import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CoursesRecord extends FirestoreRecord {
  CoursesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

  // "lessons" field.
  List<LessonStruct>? _lessons;
  List<LessonStruct> get lessons => _lessons ?? const [];
  bool hasLessons() => _lessons != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "modified_time" field.
  DateTime? _modifiedTime;
  DateTime? get modifiedTime => _modifiedTime;
  bool hasModifiedTime() => _modifiedTime != null;

  // "is_new" field.
  bool? _isNew;
  bool get isNew => _isNew ?? false;
  bool hasIsNew() => _isNew != null;

  // "is_popural" field.
  bool? _isPopural;
  bool get isPopural => _isPopural ?? false;
  bool hasIsPopural() => _isPopural != null;

  // "onboardings" field.
  List<DocumentReference>? _onboardings;
  List<DocumentReference> get onboardings => _onboardings ?? const [];
  bool hasOnboardings() => _onboardings != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _photo = snapshotData['photo'] as String?;
    _description = snapshotData['description'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _lessons = getStructList(
      snapshotData['lessons'],
      LessonStruct.fromMap,
    );
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isNew = snapshotData['is_new'] as bool?;
    _isPopural = snapshotData['is_popural'] as bool?;
    _onboardings = getDataList(snapshotData['onboardings']);
    _isDeleted = snapshotData['is_deleted'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('courses');

  static Stream<CoursesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CoursesRecord.fromSnapshot(s));

  static Future<CoursesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CoursesRecord.fromSnapshot(s));

  static CoursesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CoursesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CoursesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CoursesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CoursesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CoursesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCoursesRecordData({
  String? name,
  String? photo,
  String? description,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isNew,
  bool? isPopural,
  bool? isDeleted,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'photo': photo,
      'description': description,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_new': isNew,
      'is_popural': isPopural,
      'is_deleted': isDeleted,
    }.withoutNulls,
  );

  return firestoreData;
}

class CoursesRecordDocumentEquality implements Equality<CoursesRecord> {
  const CoursesRecordDocumentEquality();

  @override
  bool equals(CoursesRecord? e1, CoursesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.photo == e2?.photo &&
        e1?.description == e2?.description &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        listEquality.equals(e1?.lessons, e2?.lessons) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isNew == e2?.isNew &&
        e1?.isPopural == e2?.isPopural &&
        listEquality.equals(e1?.onboardings, e2?.onboardings) &&
        e1?.isDeleted == e2?.isDeleted;
  }

  @override
  int hash(CoursesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.photo,
        e?.description,
        e?.categories,
        e?.lessons,
        e?.createdTime,
        e?.modifiedTime,
        e?.isNew,
        e?.isPopural,
        e?.onboardings,
        e?.isDeleted
      ]);

  @override
  bool isValidKey(Object? o) => o is CoursesRecord;
}
