import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/profile/widgets/profile_item_component/profile_item_component_widget.dart';
import '/index.dart';
import 'debug_page_widget.dart' show DebugPageWidget;
import 'package:flutter/material.dart';

class DebugPageModel extends FlutterFlowModel<DebugPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel1;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel2;
  // Model for ProfileItemComponent component.
  late ProfileItemComponentModel profileItemComponentModel3;

  @override
  void initState(BuildContext context) {
    profileItemComponentModel1 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel2 =
        createModel(context, () => ProfileItemComponentModel());
    profileItemComponentModel3 =
        createModel(context, () => ProfileItemComponentModel());
  }

  @override
  void dispose() {
    profileItemComponentModel1.dispose();
    profileItemComponentModel2.dispose();
    profileItemComponentModel3.dispose();
  }
}
