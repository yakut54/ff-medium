import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'catalog_page_widget.dart' show CatalogPageWidget;
import 'package:flutter/material.dart';

class CatalogPageModel extends FlutterFlowModel<CatalogPageWidget> {
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

  // Stores action output result for [Backend Call - API (whois)] action in CatalogPage widget.
  ApiCallResponse? whoIsResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in CatalogPage widget.
  List<CategoriesRecord>? categories;
  // Stores action output result for [Backend Call - Read Document] action in CatalogPage widget.
  SubscriptionsRecord? sub;
  // Stores action output result for [Custom Action - subscriptionToJson] action in CatalogPage widget.
  dynamic json;
  // Model for LoadingComponent component.
  late LoadingComponentModel loadingComponentModel;
  // Model for NotConnectedComponent component.
  late NotConnectedComponentModel notConnectedComponentModel;
  // Stores action output result for [Firestore Query - Query a collection] action in NotConnectedComponent widget.
  List<CategoriesRecord>? forceCategories;
  // Stores action output result for [Backend Call - API (whois)] action in NotConnectedComponent widget.
  ApiCallResponse? forceWhoIsResponse;
  // Stores action output result for [Backend Call - Read Document] action in NotConnectedComponent widget.
  SubscriptionsRecord? forceSub;
  // Stores action output result for [Custom Action - subscriptionToJson] action in NotConnectedComponent widget.
  dynamic forceJson;

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
