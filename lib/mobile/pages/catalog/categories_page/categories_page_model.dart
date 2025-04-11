import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/no_content/no_content_widget.dart';
import 'categories_page_widget.dart' show CategoriesPageWidget;
import 'package:flutter/material.dart';

class CategoriesPageModel extends FlutterFlowModel<CategoriesPageWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NoContent component.
  late NoContentModel noContentModel;

  @override
  void initState(BuildContext context) {
    noContentModel = createModel(context, () => NoContentModel());
  }

  @override
  void dispose() {
    noContentModel.dispose();
  }
}
