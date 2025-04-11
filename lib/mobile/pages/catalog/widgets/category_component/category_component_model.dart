import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'category_component_widget.dart' show CategoryComponentWidget;
import 'package:flutter/material.dart';

class CategoryComponentModel extends FlutterFlowModel<CategoryComponentWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - meditationsGetDocsFromCategory] action in Container widget.
  List<MeditationsRecord>? meditationDocs;
  // Stores action output result for [Firestore Query - Query a collection] action in Container widget.
  List<CategoriesRecord>? subcategoryDocs;
  // Stores action output result for [Custom Action - coursesGetDocsFromCategory] action in Container widget.
  List<CoursesRecord>? courseDocs;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
