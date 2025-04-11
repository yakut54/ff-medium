import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'course_card_widget.dart' show CourseCardWidget;
import 'package:flutter/material.dart';

class CourseCardModel extends FlutterFlowModel<CourseCardWidget> {
  ///  State fields for stateful widgets in this component.

  // Stores action output result for [Custom Action - coursesGetCategories] action in Container widget.
  List<CategoriesRecord>? categories;
  // Stores action output result for [Custom Action - getAdminOnboardingList] action in IconButton widget.
  List<OnboardingsRecord>? onboardingList;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {}
}
