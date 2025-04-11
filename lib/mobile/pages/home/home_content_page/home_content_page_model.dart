import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/no_content/no_content_widget.dart';
import 'home_content_page_widget.dart' show HomeContentPageWidget;
import 'package:flutter/material.dart';

class HomeContentPageModel extends FlutterFlowModel<HomeContentPageWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for NoContent component.
  late NoContentModel noContentModel1;
  // Model for NoContent component.
  late NoContentModel noContentModel2;

  @override
  void initState(BuildContext context) {
    noContentModel1 = createModel(context, () => NoContentModel());
    noContentModel2 = createModel(context, () => NoContentModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    noContentModel1.dispose();
    noContentModel2.dispose();
  }
}
