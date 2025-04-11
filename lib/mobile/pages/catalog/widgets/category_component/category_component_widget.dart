import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/actions/actions.dart' as action_blocks;
import '/custom_code/actions/index.dart' as actions;
import '/index.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'category_component_model.dart';
export 'category_component_model.dart';

class CategoryComponentWidget extends StatefulWidget {
  const CategoryComponentWidget({
    super.key,
    required this.categoryDoc,
  });

  final CategoriesRecord? categoryDoc;

  @override
  State<CategoryComponentWidget> createState() =>
      _CategoryComponentWidgetState();
}

class _CategoryComponentWidgetState extends State<CategoryComponentWidget> {
  late CategoryComponentModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoryComponentModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return InkWell(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () async {
        var _shouldSetState = false;
        if (FFAppState().hasInternetConnection &&
            !FFAppState().hasVpnConnection) {
          _model.meditationDocs = await actions.meditationsGetDocsFromCategory(
            widget.categoryDoc!,
          );
          _shouldSetState = true;
          if (widget.categoryDoc!.undeletable) {
            _model.subcategoryDocs = await queryCategoriesRecordOnce(
              queryBuilder: (categoriesRecord) => categoriesRecord.where(
                'subcategory_of',
                isEqualTo: widget.categoryDoc?.reference,
              ),
            );
            _shouldSetState = true;

            context.pushNamed(
              SubcategoriesPageWidget.routeName,
              queryParameters: {
                'title': serializeParam(
                  widget.categoryDoc?.name,
                  ParamType.String,
                ),
                'subcategoryDocs': serializeParam(
                  _model.subcategoryDocs,
                  ParamType.Document,
                  isList: true,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'subcategoryDocs': _model.subcategoryDocs,
              },
            );

            if (_shouldSetState) safeSetState(() {});
            return;
          } else {
            _model.courseDocs = await actions.coursesGetDocsFromCategory(
              widget.categoryDoc!,
            );
            _shouldSetState = true;

            context.pushNamed(
              CategoriesPageWidget.routeName,
              queryParameters: {
                'meditationDocs': serializeParam(
                  _model.meditationDocs,
                  ParamType.Document,
                  isList: true,
                ),
                'categoryDoc': serializeParam(
                  widget.categoryDoc,
                  ParamType.Document,
                ),
                'coursesDocs': serializeParam(
                  _model.courseDocs,
                  ParamType.Document,
                  isList: true,
                ),
              }.withoutNulls,
              extra: <String, dynamic>{
                'meditationDocs': _model.meditationDocs,
                'categoryDoc': widget.categoryDoc,
                'coursesDocs': _model.courseDocs,
              },
            );

            if (_shouldSetState) safeSetState(() {});
            return;
          }
        } else {
          await action_blocks.notConnectedSnackBar(context);
          if (_shouldSetState) safeSetState(() {});
          return;
        }

        if (_shouldSetState) safeSetState(() {});
      },
      child: Container(
        width: 168.0,
        height: 80.0,
        decoration: BoxDecoration(
          color: Color(0xFFEAF5F1),
          borderRadius: BorderRadius.circular(11.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(0.0, 16.0, 16.0, 16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(12.0, 14.0, 8.0, 14.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 250),
                    fadeOutDuration: Duration(milliseconds: 250),
                    imageUrl: widget.categoryDoc!.icon,
                    width: 24.0,
                    height: 24.0,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  widget.categoryDoc!.name,
                  textAlign: TextAlign.start,
                  maxLines: 2,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Vela Sans',
                        color: Color(0xFF131316),
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w600,
                        useGoogleFonts: false,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
