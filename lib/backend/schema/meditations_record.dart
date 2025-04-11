import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class MeditationsRecord extends FirestoreRecord {
  MeditationsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "photo" field.
  String? _photo;
  String get photo => _photo ?? '';
  bool hasPhoto() => _photo != null;

  // "categories" field.
  List<DocumentReference>? _categories;
  List<DocumentReference> get categories => _categories ?? const [];
  bool hasCategories() => _categories != null;

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

  // "is_popular" field.
  bool? _isPopular;
  bool get isPopular => _isPopular ?? false;
  bool hasIsPopular() => _isPopular != null;

  // "is_podcast" field.
  bool? _isPodcast;
  bool get isPodcast => _isPodcast ?? false;
  bool hasIsPodcast() => _isPodcast != null;

  // "lessons" field.
  List<LessonStruct>? _lessons;
  List<LessonStruct> get lessons => _lessons ?? const [];
  bool hasLessons() => _lessons != null;

  // "onboardings" field.
  List<DocumentReference>? _onboardings;
  List<DocumentReference> get onboardings => _onboardings ?? const [];
  bool hasOnboardings() => _onboardings != null;

  // "is_deleted" field.
  bool? _isDeleted;
  bool get isDeleted => _isDeleted ?? false;
  bool hasIsDeleted() => _isDeleted != null;

  // "for_women" field.
  bool? _forWomen;
  bool get forWomen => _forWomen ?? false;
  bool hasForWomen() => _forWomen != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _description = snapshotData['description'] as String?;
    _photo = snapshotData['photo'] as String?;
    _categories = getDataList(snapshotData['categories']);
    _createdTime = snapshotData['created_time'] as DateTime?;
    _modifiedTime = snapshotData['modified_time'] as DateTime?;
    _isNew = snapshotData['is_new'] as bool?;
    _isPopular = snapshotData['is_popular'] as bool?;
    _isPodcast = snapshotData['is_podcast'] as bool?;
    _lessons = getStructList(
      snapshotData['lessons'],
      LessonStruct.fromMap,
    );
    _onboardings = getDataList(snapshotData['onboardings']);
    _isDeleted = snapshotData['is_deleted'] as bool?;
    _forWomen = snapshotData['for_women'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('meditations');

  static Stream<MeditationsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => MeditationsRecord.fromSnapshot(s));

  static Future<MeditationsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => MeditationsRecord.fromSnapshot(s));

  static MeditationsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      MeditationsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static MeditationsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      MeditationsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'MeditationsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is MeditationsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createMeditationsRecordData({
  String? name,
  String? description,
  String? photo,
  DateTime? createdTime,
  DateTime? modifiedTime,
  bool? isNew,
  bool? isPopular,
  bool? isPodcast,
  bool? isDeleted,
  bool? forWomen,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'description': description,
      'photo': photo,
      'created_time': createdTime,
      'modified_time': modifiedTime,
      'is_new': isNew,
      'is_popular': isPopular,
      'is_podcast': isPodcast,
      'is_deleted': isDeleted,
      'for_women': forWomen,
    }.withoutNulls,
  );

  return firestoreData;
}

class MeditationsRecordDocumentEquality implements Equality<MeditationsRecord> {
  const MeditationsRecordDocumentEquality();

  @override
  bool equals(MeditationsRecord? e1, MeditationsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.description == e2?.description &&
        e1?.photo == e2?.photo &&
        listEquality.equals(e1?.categories, e2?.categories) &&
        e1?.createdTime == e2?.createdTime &&
        e1?.modifiedTime == e2?.modifiedTime &&
        e1?.isNew == e2?.isNew &&
        e1?.isPopular == e2?.isPopular &&
        e1?.isPodcast == e2?.isPodcast &&
        listEquality.equals(e1?.lessons, e2?.lessons) &&
        listEquality.equals(e1?.onboardings, e2?.onboardings) &&
        e1?.isDeleted == e2?.isDeleted &&
        e1?.forWomen == e2?.forWomen;
  }

  @override
  int hash(MeditationsRecord? e) => const ListEquality().hash([
        e?.name,
        e?.description,
        e?.photo,
        e?.categories,
        e?.createdTime,
        e?.modifiedTime,
        e?.isNew,
        e?.isPopular,
        e?.isPodcast,
        e?.lessons,
        e?.onboardings,
        e?.isDeleted,
        e?.forWomen
      ]);

  @override
  bool isValidKey(Object? o) => o is MeditationsRecord;
}
