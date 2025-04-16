import '/auth/firebase_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/category_component/category_component_widget.dart';
import '/custom_code/actions/index.dart' as actions;
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'catalog_page_model.dart';
export 'catalog_page_model.dart';

class CatalogPageWidget extends StatefulWidget {
  const CatalogPageWidget({super.key});

  static String routeName = 'CatalogPage';
  static String routePath = '/catalogPage';

  @override
  State<CatalogPageWidget> createState() => _CatalogPageWidgetState();
}

class _CatalogPageWidgetState extends State<CatalogPageWidget> {
  late CatalogPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CatalogPageModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      if (FFAppState().hasInternetConnection &&
          !FFAppState().hasVpnConnection) {
        await Future.wait([
          Future(() async {
            if (FFAppState().deviceInfo.countryCode == '') {
              _model.whoIsResponse = await WhoisCall.call();

              FFAppState().updateDeviceInfoStruct(
                (e) => e
                  ..countryCode = WhoisCall.countryCode(
                    (_model.whoIsResponse?.jsonBody ?? ''),
                  ),
              );

              await currentUserReference!.update(createUsersRecordData(
                countryCode: WhoisCall.countryCode(
                  (_model.whoIsResponse?.jsonBody ?? ''),
                ),
              ));
            }
          }),
          Future(() async {
            _model.categories = await queryCategoriesRecordOnce(
              queryBuilder: (categoriesRecord) => categoriesRecord
                  .where(
                    'is_subcategory',
                    isEqualTo: false,
                  )
                  .orderBy('created_at', descending: true),
            );
          }),
          Future(() async {
            _model.sub = await SubscriptionsRecord.getDocumentOnce(
                functions.userGetSubscroptionRef());
            _model.json = await actions.subscriptionToJson(
              _model.sub,
            );
            FFAppState().subscriptionSnapshot = _model.json!;
            safeSetState(() {});
          }),
        ]);
        _model.categoryDocs =
            _model.categories!.toList().cast<CategoriesRecord>();
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
                        Align(
                          alignment: AlignmentDirectional(-1.0, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                16.0, 0.0, 0.0, 24.0),
                            child: Text(
                              'Поиск по категориям',
                              textAlign: TextAlign.start,
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Vela Sans',
                                    fontSize: 24.0,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                    useGoogleFonts: false,
                                  ),
                            ),
                          ),
                        ),
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
                                            'Keyy7k_${docsIndex}_of_${docs.length}'),
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
                return Align(
                  alignment: AlignmentDirectional(0.0, 0.0),
                  child: wrapWithModel(
                    model: _model.notConnectedComponentModel,
                    updateCallback: () => safeSetState(() {}),
                    child: NotConnectedComponentWidget(
                      action: () async {
                        var _shouldSetState = false;
                        if (FFAppState().hasInternetConnection &&
                            !FFAppState().hasVpnConnection) {
                          await Future.wait([
                            Future(() async {
                              _model.forceCategories =
                                  await queryCategoriesRecordOnce(
                                queryBuilder: (categoriesRecord) =>
                                    categoriesRecord
                                        .where(
                                          'is_subcategory',
                                          isEqualTo: false,
                                        )
                                        .orderBy('created_at',
                                            descending: true),
                              );
                              _shouldSetState = true;
                            }),
                            Future(() async {
                              if (FFAppState().deviceInfo.countryCode == '') {
                                _model.forceWhoIsResponse =
                                    await WhoisCall.call();

                                _shouldSetState = true;
                                FFAppState().updateDeviceInfoStruct(
                                  (e) => e
                                    ..countryCode = WhoisCall.countryCode(
                                      (_model.forceWhoIsResponse?.jsonBody ??
                                          ''),
                                    ),
                                );

                                await currentUserReference!
                                    .update(createUsersRecordData(
                                  countryCode: WhoisCall.countryCode(
                                    (_model.forceWhoIsResponse?.jsonBody ?? ''),
                                  ),
                                ));
                              }
                            }),
                            Future(() async {
                              _model.forceSub =
                                  await SubscriptionsRecord.getDocumentOnce(
                                      functions.userGetSubscroptionRef());
                              _shouldSetState = true;
                              _model.forceJson =
                                  await actions.subscriptionToJson(
                                _model.forceSub,
                              );
                              _shouldSetState = true;
                              FFAppState().subscriptionSnapshot =
                                  _model.forceJson!;
                              safeSetState(() {});
                            }),
                          ]);
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
