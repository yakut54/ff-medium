import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'subcategories_page_widget.dart' show SubcategoriesPageWidget;
import 'package:flutter/material.dart';

class SubcategoriesPageModel extends FlutterFlowModel<SubcategoriesPageWidget> {
  ///  Local state fields for this page.

  LoadingState? pageState = LoadingState.loading;

  List<CategoriesRecord> categoryDocs = [];
  void addToCategoryDocs(CategoriesRecord item) => categoryDocs.add(item);
  void removeFromCategoryDocs(CategoriesRecord item) =>
      categoryDocs.remove(item);
  void removeAtIndexFromCategoryDocs(int index) => categoryDocs.removeAt(index);
  void insertAtIndexInCategoryDocs(int index, CategoriesRecord item) =>
      categoryDocs.insert(index, item);
  void updateCategoryDocsAtIndex(
          int index, Function(CategoriesRecord) updateFn) =>
      categoryDocs[index] = updateFn(categoryDocs[index]);

  ///  State fields for stateful widgets in this page.

  // Model for LoadingComponent component.
  late LoadingComponentModel loadingComponentModel;
  // Model for NotConnectedComponent component.
  late NotConnectedComponentModel notConnectedComponentModel;
  // Stores action output result for [Firestore Query - Query a collection] action in NotConnectedComponent widget.
  List<CategoriesRecord>? forceCategories;

  @override
  void initState(BuildContext context) {
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
    notConnectedComponentModel =
        createModel(context, () => NotConnectedComponentModel());
  }

  @override
  void dispose() {
    loadingComponentModel.dispose();
    notConnectedComponentModel.dispose();
  }
}
