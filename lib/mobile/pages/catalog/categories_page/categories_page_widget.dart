import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/cards/course_card/course_card_widget.dart';
import '/common/cards/meditation_card/meditation_card_widget.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/catalog/widgets/no_content/no_content_widget.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'categories_page_model.dart';
export 'categories_page_model.dart';

class CategoriesPageWidget extends StatefulWidget {
  const CategoriesPageWidget({
    super.key,
    this.meditationDocs,
    required this.categoryDoc,
    this.coursesDocs,
  });

  final List<MeditationsRecord>? meditationDocs;
  final CategoriesRecord? categoryDoc;
  final List<CoursesRecord>? coursesDocs;

  static String routeName = 'CategoriesPage';
  static String routePath = '/categoriesPage';

  @override
  State<CategoriesPageWidget> createState() => _CategoriesPageWidgetState();
}

class _CategoriesPageWidgetState extends State<CategoriesPageWidget> {
  late CategoriesPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CategoriesPageModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              widget.categoryDoc?.name,
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
          child: Align(
            alignment: AlignmentDirectional(0.0, 0.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width * 1.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: Builder(
                builder: (context) {
                  if ((widget.meditationDocs != null &&
                          (widget.meditationDocs)!.isNotEmpty) ||
                      (widget.coursesDocs != null &&
                          (widget.coursesDocs)!.isNotEmpty)) {
                    return ListView(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (widget.coursesDocs != null &&
                                (widget.coursesDocs)!.isNotEmpty)
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Align(
                                    alignment: AlignmentDirectional(-1.0, 0.0),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          16.0, 0.0, 0.0, 0.0),
                                      child: Text(
                                        'Курсы',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Vela Sans',
                                              fontSize: 16.0,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.bold,
                                              useGoogleFonts: false,
                                            ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 16.0),
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Builder(
                                          builder: (context) {
                                            final coursesList = functions
                                                .coursesSortByTime(widget
                                                    .coursesDocs!
                                                    .toList())
                                                .toList();

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        coursesList.length,
                                                        (coursesListIndex) {
                                                  final coursesListItem =
                                                      coursesList[
                                                          coursesListIndex];
                                                  return CourseCardWidget(
                                                    key: Key(
                                                        'Keyv7f_${coursesListIndex}_of_${coursesList.length}'),
                                                    cardType: CardType.big,
                                                    courseDoc: coursesListItem,
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(width: 16.0))
                                                    .addToStart(
                                                        SizedBox(width: 16.0))
                                                    .addToEnd(
                                                        SizedBox(width: 16.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ].divide(SizedBox(height: 16.0)),
                              ),
                            if (widget.meditationDocs != null &&
                                (widget.meditationDocs)!.isNotEmpty)
                              Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(-1.0, 0.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            16.0, 0.0, 0.0, 0.0),
                                        child: Text(
                                          'Медитации',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Vela Sans',
                                                fontSize: 16.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.bold,
                                                useGoogleFonts: false,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(),
                                      child: Align(
                                        alignment:
                                            AlignmentDirectional(-1.0, -1.0),
                                        child: Builder(
                                          builder: (context) {
                                            final meditationDocs = functions
                                                .meditationsSortByTime(widget
                                                    .meditationDocs!
                                                    .toList())
                                                .toList();

                                            return SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                        meditationDocs.length,
                                                        (meditationDocsIndex) {
                                                  final meditationDocsItem =
                                                      meditationDocs[
                                                          meditationDocsIndex];
                                                  return MeditationCardWidget(
                                                    key: Key(
                                                        'Key39g_${meditationDocsIndex}_of_${meditationDocs.length}'),
                                                    meditationDoc:
                                                        meditationDocsItem,
                                                    cardType: CardType.standart,
                                                  );
                                                })
                                                    .divide(
                                                        SizedBox(width: 16.0))
                                                    .around(
                                                        SizedBox(width: 16.0)),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ].divide(SizedBox(height: 16.0)),
                                ),
                              ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return wrapWithModel(
                      model: _model.noContentModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NoContentWidget(
                        hideButton: false,
                      ),
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
