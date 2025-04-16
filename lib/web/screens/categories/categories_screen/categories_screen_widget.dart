import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/web/screens/categories/c_e_categoty_item/c_e_categoty_item_widget.dart';
import '/web/ui/delete_item/delete_item_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'categories_screen_model.dart';
export 'categories_screen_model.dart';

class CategoriesScreenWidget extends StatefulWidget {
  const CategoriesScreenWidget({super.key});

  @override
  State<CategoriesScreenWidget> createState() => _CategoriesScreenWidgetState();
}

class _CategoriesScreenWidgetState extends State<CategoriesScreenWidget> {
  late CategoriesScreenModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesScreenModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<CategoriesRecord>>(
      stream: queryCategoriesRecord(
        queryBuilder: (categoriesRecord) =>
            categoriesRecord.orderBy('created_at', descending: true),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 32.0,
              height: 32.0,
              child: SpinKitHourGlass(
                color: FlutterFlowTheme.of(context).primaryBackground,
                size: 32.0,
              ),
            ),
          );
        }
        List<CategoriesRecord> containerCategoriesRecordList = snapshot.data!;

        return Container(
          decoration: BoxDecoration(),
          child: ListView(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            children: [
              Builder(
                builder: (context) {
                  final categoriesList = functions
                      .categoriesAdminSort(
                          containerCategoriesRecordList.toList())
                      .toList();

                  return Column(
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(categoriesList.length,
                        (categoriesListIndex) {
                      final categoriesListItem =
                          categoriesList[categoriesListIndex];
                      return Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 0.0, 16.0, 0.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              constraints: BoxConstraints(
                                maxWidth: 400.0,
                              ),
                              decoration: BoxDecoration(),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                          child: CachedNetworkImage(
                                            fadeInDuration:
                                                Duration(milliseconds: 500),
                                            fadeOutDuration:
                                                Duration(milliseconds: 500),
                                            imageUrl: categoriesListItem.icon,
                                            width: 24.0,
                                            height: 24.0,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        Flexible(
                                          child: Container(
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(8.0, 8.0, 8.0, 8.0),
                                              child: Text(
                                                categoriesListItem.name,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily:
                                                              'Vela Sans',
                                                          letterSpacing: 0.0,
                                                          useGoogleFonts: false,
                                                        ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      if (categoriesListItem.subcategoryOf !=
                                          null)
                                        StreamBuilder<CategoriesRecord>(
                                          stream: CategoriesRecord.getDocument(
                                              categoriesListItem
                                                  .subcategoryOf!),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 50,
                                                  height: 50,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0x001C1C1C),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }

                                            final imageCategoriesRecord =
                                                snapshot.data!;

                                            return ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              child: CachedNetworkImage(
                                                fadeInDuration:
                                                    Duration(milliseconds: 500),
                                                fadeOutDuration:
                                                    Duration(milliseconds: 500),
                                                imageUrl:
                                                    imageCategoriesRecord.icon,
                                                width: 24.0,
                                                height: 24.0,
                                                fit: BoxFit.cover,
                                              ),
                                            );
                                          },
                                        ),
                                      FlutterFlowIconButton(
                                        borderColor: Colors.transparent,
                                        borderRadius: 20.0,
                                        borderWidth: 0.0,
                                        buttonSize: 40.0,
                                        fillColor: Colors.transparent,
                                        icon: Icon(
                                          Icons.edit,
                                          color: FlutterFlowTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding:
                                                    MediaQuery.viewInsetsOf(
                                                        context),
                                                child: CECategotyItemWidget(
                                                  categoryItem:
                                                      categoriesListItem,
                                                ),
                                              );
                                            },
                                          ).then(
                                              (value) => safeSetState(() {}));
                                        },
                                      ),
                                      if (!categoriesListItem.undeletable &&
                                          (containerCategoriesRecordList
                                                  .length >
                                              1))
                                        Builder(
                                          builder: (context) =>
                                              FlutterFlowIconButton(
                                            borderColor: Colors.transparent,
                                            borderRadius: 20.0,
                                            borderWidth: 0.0,
                                            buttonSize: 40.0,
                                            fillColor: Colors.transparent,
                                            icon: Icon(
                                              Icons.delete_sweep,
                                              color: Color(0xFFFF0000),
                                              size: 24.0,
                                            ),
                                            onPressed: () async {
                                              await showDialog(
                                                context: context,
                                                builder: (dialogContext) {
                                                  return Dialog(
                                                    elevation: 0,
                                                    insetPadding:
                                                        EdgeInsets.zero,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    alignment:
                                                        AlignmentDirectional(
                                                                0.0, 0.0)
                                                            .resolve(
                                                                Directionality.of(
                                                                    context)),
                                                    child: DeleteItemWidget(
                                                      categoryItem:
                                                          categoriesListItem,
                                                      text:
                                                          'Вы уверены, что хотите удалить категорию?',
                                                      subtitle:
                                                          'Отменить это действие будет невозможно!',
                                                      action: () async {},
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: double.infinity,
                              height: 1.0,
                              constraints: BoxConstraints(
                                maxWidth: 400.0,
                              ),
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context).primaryText,
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  );
                },
              ),
              Align(
                alignment: AlignmentDirectional(0.0, 1.0),
                child: Container(
                  constraints: BoxConstraints(
                    maxWidth: 400.0,
                  ),
                  decoration: BoxDecoration(),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Container(
                          decoration: BoxDecoration(),
                        ),
                      ),
                      FlutterFlowIconButton(
                        borderColor: Colors.transparent,
                        borderRadius: 20.0,
                        borderWidth: 0.0,
                        buttonSize: 40.0,
                        fillColor: Colors.transparent,
                        icon: Icon(
                          Icons.add_rounded,
                          color: FlutterFlowTheme.of(context).primaryText,
                          size: 24.0,
                        ),
                        onPressed: () async {
                          await showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            enableDrag: false,
                            context: context,
                            builder: (context) {
                              return Padding(
                                padding: MediaQuery.viewInsetsOf(context),
                                child: CECategotyItemWidget(),
                              );
                            },
                          ).then((value) => safeSetState(() {}));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
