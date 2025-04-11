import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/category_component/category_component_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'subcategories_page_model.dart';
export 'subcategories_page_model.dart';

class SubcategoriesPageWidget extends StatefulWidget {
  const SubcategoriesPageWidget({
    super.key,
    required this.title,
    required this.subcategoryDocs,
  });

  final String? title;
  final List<CategoriesRecord>? subcategoryDocs;

  static String routeName = 'SubcategoriesPage';
  static String routePath = '/subcategoriesPage';

  @override
  State<SubcategoriesPageWidget> createState() =>
      _SubcategoriesPageWidgetState();
}

class _SubcategoriesPageWidgetState extends State<SubcategoriesPageWidget> {
  late SubcategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => SubcategoriesPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().hasInternetConnection &&
          !FFAppState().hasVpnConnection) {
        _model.categoryDocs =
            widget.subcategoryDocs!.toList().cast<CategoriesRecord>();
        _model.pageState = LoadingState.loaded;
        safeSetState(() {});
        return;
      } else {
        _model.pageState = LoadingState.failure;
        safeSetState(() {});
        return;
      }
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30.0,
            borderWidth: 1.0,
            buttonSize: 60.0,
            icon: Icon(
              Icons.arrow_back_ios_rounded,
              color: Colors.black,
              size: 24.0,
            ),
            onPressed: () async {
              context.pop();
            },
          ),
          title: Text(
            valueOrDefault<String>(
              widget.title,
              '_',
            ).maybeHandleOverflow(
              maxChars: 20,
              replacement: '…',
            ),
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Vela Sans',
                  color: Colors.black,
                  fontSize: 16.0,
                  letterSpacing: 0.0,
                  fontWeight: FontWeight.w600,
                  useGoogleFonts: false,
                ),
          ),
          actions: [],
          centerTitle: true,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Builder(
            builder: (context) {
              if (_model.pageState == LoadingState.loaded) {
                return Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0.0, 20.0, 0.0, 0.0),
                  child: Container(
                    decoration: BoxDecoration(),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Expanded(
                          child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(),
                            child: Builder(
                              builder: (context) {
                                final docs = _model.categoryDocs.toList();

                                return GridView.builder(
                                  padding: EdgeInsets.fromLTRB(
                                    0,
                                    0,
                                    0,
                                    16.0,
                                  ),
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10.0,
                                    mainAxisSpacing: 10.0,
                                    childAspectRatio: 2.0,
                                  ),
                                  scrollDirection: Axis.vertical,
                                  itemCount: docs.length,
                                  itemBuilder: (context, docsIndex) {
                                    final docsItem = docs[docsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          valueOrDefault<double>(
                                            ((int documentIndex) {
                                              return documentIndex % 2 == 0
                                                  ? 16
                                                  : 0;
                                            }(docsIndex))
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0,
                                          valueOrDefault<double>(
                                            ((int documentIndex) {
                                              return documentIndex % 2 == 0
                                                  ? 0
                                                  : 16;
                                            }(docsIndex))
                                                .toDouble(),
                                            0.0,
                                          ),
                                          0.0),
                                      child: CategoryComponentWidget(
                                        key: Key(
                                            'Keykl9_${docsIndex}_of_${docs.length}'),
                                        categoryDoc: docsItem,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (_model.pageState == LoadingState.loading) {
                return wrapWithModel(
                  model: _model.loadingComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: LoadingComponentWidget(
                    message: 'Загружаем категории...',
                  ),
                );
              } else {
                return wrapWithModel(
                  model: _model.notConnectedComponentModel,
                  updateCallback: () => safeSetState(() {}),
                  child: NotConnectedComponentWidget(
                    action: () async {
                      var _shouldSetState = false;
                      if (FFAppState().hasInternetConnection &&
                          !FFAppState().hasVpnConnection) {
                        _model.forceCategories =
                            await queryCategoriesRecordOnce();
                        _shouldSetState = true;
                        _model.categoryDocs = _model.forceCategories!
                            .toList()
                            .cast<CategoriesRecord>();
                        _model.pageState = LoadingState.loaded;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      } else {
                        _model.pageState = LoadingState.failure;
                        safeSetState(() {});
                        if (_shouldSetState) safeSetState(() {});
                        return;
                      }

                      if (_shouldSetState) safeSetState(() {});
                    },
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
