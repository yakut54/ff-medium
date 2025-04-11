import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import '/web/ui/empty_filter/empty_filter_widget.dart';
import 'courses_screen_widget.dart' show CoursesScreenWidget;
import 'package:flutter/material.dart';

class CoursesScreenModel extends FlutterFlowModel<CoursesScreenWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for DropDown widget.
  List<String>? dropDownValue;
  FormFieldController<List<String>>? dropDownValueController;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // State field(s) for Switch widget.
  bool? switchValue3;
  // Stores action output result for [Custom Action - getAdminOnboardingList] action in IconButton widget.
  List<OnboardingsRecord>? onboardingList;
  // Model for EmptyFilter component.
  late EmptyFilterModel emptyFilterModel;

  @override
  void initState(BuildContext context) {
    emptyFilterModel = createModel(context, () => EmptyFilterModel());
  }

  @override
  void dispose() {
    emptyFilterModel.dispose();
  }
}
