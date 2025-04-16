import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CategoriesRecord extends FirestoreRecord {
  CategoriesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "icon" field.
  String? _icon;
  String get icon => _icon ?? '';
  bool hasIcon() => _icon != null;

  // "meditations" field.
  List<DocumentReference>? _meditations;
  List<DocumentReference> get meditations => _meditations ?? const [];
  bool hasMeditations() => _meditations != null;

  // "courses" field.
  List<DocumentReference>? _courses;
  List<DocumentReference> get courses => _courses ?? const [];
  bool hasCourses() => _courses != null;

  // "subcategory_of" field.
  DocumentReference? _subcategoryOf;
  DocumentReference? get subcategoryOf => _subcategoryOf;
  bool hasSubcategoryOf() => _subcategoryOf != null;

  // "undeletable" field.
  bool? _undeletable;
  bool get undeletable => _undeletable ?? false;
  bool hasUndeletable() => _undeletable != null;

  // "subcategories" field.
  List<DocumentReference>? _subcategories;
  List<DocumentReference> get subcategories => _subcategories ?? const [];
  bool hasSubcategories() => _subcategories != null;

  // "is_subcategory" field.
  bool? _isSubcategory;
  bool get isSubcategory => _isSubcategory ?? false;
  bool hasIsSubcategory() => _isSubcategory != null;

  // "created_at" field.
  DateTime? _createdAt;
  DateTime? get createdAt => _createdAt;
  bool hasCreatedAt() => _createdAt != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _icon = snapshotData['icon'] as String?;
    _meditations = getDataList(snapshotData['meditations']);
    _courses = getDataList(snapshotData['courses']);
    _subcategoryOf = snapshotData['subcategory_of'] as DocumentReference?;
    _undeletable = snapshotData['undeletable'] as bool?;
    _subcategories = getDataList(snapshotData['subcategories']);
    _isSubcategory = snapshotData['is_subcategory'] as bool?;
    _createdAt = snapshotData['created_at'] as DateTime?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('categories');

  static Stream<CategoriesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CategoriesRecord.fromSnapshot(s));

  static Future<CategoriesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CategoriesRecord.fromSnapshot(s));

  static CategoriesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CategoriesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CategoriesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CategoriesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CategoriesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CategoriesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCategoriesRecordData({
  String? name,
  String? icon,
  DocumentReference? subcategoryOf,
  bool? undeletable,
  bool? isSubcategory,
  DateTime? createdAt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'icon': icon,
      'subcategory_of': subcategoryOf,
      'undeletable': undeletable,
      'is_subcategory': isSubcategory,
      'created_at': createdAt,
    }.withoutNulls,
  );

  return firestoreData;
}

class CategoriesRecordDocumentEquality implements Equality<CategoriesRecord> {
  const CategoriesRecordDocumentEquality();

  @override
  bool equals(CategoriesRecord? e1, CategoriesRecord? e2) {
    const listEquality = ListEquality();
    return e1?.name == e2?.name &&
        e1?.icon == e2?.icon &&
        listEquality.equals(e1?.meditations, e2?.meditations) &&
        listEquality.equals(e1?.courses, e2?.courses) &&
        e1?.subcategoryOf == e2?.subcategoryOf &&
        e1?.undeletable == e2?.undeletable &&
        listEquality.equals(e1?.subcategories, e2?.subcategories) &&
        e1?.isSubcategory == e2?.isSubcategory &&
        e1?.createdAt == e2?.createdAt;
  }

  @override
  int hash(CategoriesRecord? e) => const ListEquality().hash([
        e?.name,
        e?.icon,
        e?.meditations,
        e?.courses,
        e?.subcategoryOf,
        e?.undeletable,
        e?.subcategories,
        e?.isSubcategory,
        e?.createdAt
      ]);

  @override
  bool isValidKey(Object? o) => o is CategoriesRecord;
}
