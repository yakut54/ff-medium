import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import 'dart:async';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'c_e_categoty_item_model.dart';
export 'c_e_categoty_item_model.dart';

class CECategotyItemWidget extends StatefulWidget {
  const CECategotyItemWidget({
    super.key,
    this.categoryItem,
  });

  final CategoriesRecord? categoryItem;

  @override
  State<CECategotyItemWidget> createState() => _CECategotyItemWidgetState();
}

class _CECategotyItemWidgetState extends State<CECategotyItemWidget> {
  late CECategotyItemModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CECategotyItemModel());

    _model.textController ??= TextEditingController(
        text: widget.categoryItem != null ? widget.categoryItem?.name : (''));
    _model.textFieldFocusNode ??= FocusNode();

    _model.switchValue = widget.categoryItem?.subcategoryOf != null;
    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional(0.0, 0.0),
      child: Container(
        constraints: BoxConstraints(
          maxWidth: 400.0,
        ),
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).primaryBackground,
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: AlignmentDirectional(1.0, 0.0),
                child: FlutterFlowIconButton(
                  borderColor: Colors.transparent,
                  borderRadius: 20.0,
                  borderWidth: 1.0,
                  buttonSize: 40.0,
                  fillColor: Colors.transparent,
                  icon: Icon(
                    Icons.close_rounded,
                    color: FlutterFlowTheme.of(context).primaryText,
                    size: 24.0,
                  ),
                  onPressed: () async {
                    Navigator.pop(context);
                  },
                ),
              ),
              Form(
                key: _model.formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: TextFormField(
                  controller: _model.textController,
                  focusNode: _model.textFieldFocusNode,
                  onChanged: (_) => EasyDebounce.debounce(
                    '_model.textController',
                    Duration(milliseconds: 100),
                    () => safeSetState(() {}),
                  ),
                  autofocus: true,
                  obscureText: false,
                  decoration: InputDecoration(
                    hintText: 'Введите текст',
                    hintStyle: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Vela Sans',
                          color: FlutterFlowTheme.of(context).secondaryText,
                          fontSize: 16.0,
                          letterSpacing: 0.0,
                          fontWeight: FontWeight.w500,
                          useGoogleFonts: false,
                        ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primaryText,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).primary,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: FlutterFlowTheme.of(context).error,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    contentPadding:
                        EdgeInsetsDirectional.fromSTEB(15.0, 15.0, 0.0, 15.0),
                  ),
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Vela Sans',
                        fontSize: 16.0,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w500,
                        useGoogleFonts: false,
                      ),
                  maxLines: 10,
                  minLines: 5,
                  maxLength: 20,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  validator:
                      _model.textControllerValidator.asValidator(context),
                ),
              ),
              if (widget.categoryItem != null
                  ? !widget.categoryItem!.undeletable
                  : true)
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Подкатегория',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Vela Sans',
                            fontSize: 20.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                            useGoogleFonts: false,
                          ),
                    ),
                    Switch.adaptive(
                      value: _model.switchValue!,
                      onChanged: (newValue) async {
                        safeSetState(() => _model.switchValue = newValue);
                      },
                      activeColor: FlutterFlowTheme.of(context).primary,
                      activeTrackColor: FlutterFlowTheme.of(context).primary,
                      inactiveTrackColor:
                          FlutterFlowTheme.of(context).alternate,
                      inactiveThumbColor: FlutterFlowTheme.of(context).primary,
                    ),
                  ],
                ),
              Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (widget.categoryItem != null
                          ? (widget.categoryItem?.hasIcon() != null)
                          : (_model.uploadedFileUrl != ''))
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              16.0, 0.0, 16.0, 0.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Image.network(
                              widget.categoryItem != null
                                  ? (_model.uploadedFileUrl != ''
                                      ? _model.uploadedFileUrl
                                      : widget.categoryItem!.icon)
                                  : _model.uploadedFileUrl,
                              width: 48.0,
                              height: 48.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      Expanded(
                        child: FFButtonWidget(
                          onPressed: () async {
                            final selectedMedia = await selectMedia(
                              maxWidth: 48.00,
                              maxHeight: 48.00,
                              mediaSource: MediaSource.photoGallery,
                              multiImage: false,
                            );
                            if (selectedMedia != null &&
                                selectedMedia.every((m) => validateFileFormat(
                                    m.storagePath, context))) {
                              safeSetState(() => _model.isDataUploading = true);
                              var selectedUploadedFiles = <FFUploadedFile>[];

                              var downloadUrls = <String>[];
                              try {
                                selectedUploadedFiles = selectedMedia
                                    .map((m) => FFUploadedFile(
                                          name: m.storagePath.split('/').last,
                                          bytes: m.bytes,
                                          height: m.dimensions?.height,
                                          width: m.dimensions?.width,
                                          blurHash: m.blurHash,
                                        ))
                                    .toList();

                                downloadUrls = (await Future.wait(
                                  selectedMedia.map(
                                    (m) async => await uploadData(
                                        m.storagePath, m.bytes),
                                  ),
                                ))
                                    .where((u) => u != null)
                                    .map((u) => u!)
                                    .toList();
                              } finally {
                                _model.isDataUploading = false;
                              }
                              if (selectedUploadedFiles.length ==
                                      selectedMedia.length &&
                                  downloadUrls.length == selectedMedia.length) {
                                safeSetState(() {
                                  _model.uploadedLocalFile =
                                      selectedUploadedFiles.first;
                                  _model.uploadedFileUrl = downloadUrls.first;
                                });
                              } else {
                                safeSetState(() {});
                                return;
                              }
                            }
                          },
                          text: (widget.categoryItem != null
                                  ? widget.categoryItem!.hasIcon()
                                  : (_model.uploadedFileUrl != ''))
                              ? 'Заменить иконку'
                              : 'Добавить иконку',
                          options: FFButtonOptions(
                            width: double.infinity,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                24.0, 0.0, 24.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: Color(0xFF1C1C1C),
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Vela Sans',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                  useGoogleFonts: false,
                                ),
                            elevation: 0.0,
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Text(
                      _model.error!,
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Vela Sans',
                            color: _model.error != null && _model.error != ''
                                ? FlutterFlowTheme.of(context).error
                                : FlutterFlowTheme.of(context)
                                    .primaryBackground,
                            fontSize: 16.0,
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.bold,
                            useGoogleFonts: false,
                          ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 50.0,
                decoration: BoxDecoration(),
                child: FFButtonWidget(
                  onPressed: _model.isDataUploading
                      ? null
                      : () async {
                          if (_model.formKey.currentState == null ||
                              !_model.formKey.currentState!.validate()) {
                            return;
                          }
                          if (widget.categoryItem != null) {
                            unawaited(
                              () async {
                                await widget.categoryItem!.reference
                                    .update(createCategoriesRecordData(
                                  name: _model.textController.text,
                                  icon: _model.uploadedFileUrl != ''
                                      ? _model.uploadedFileUrl
                                      : widget.categoryItem?.icon,
                                  subcategoryOf: _model.switchValue!
                                      ? functions.getWomensMeditationsRef()
                                      : null,
                                  isSubcategory: _model.switchValue,
                                ));
                              }(),
                            );
                          } else {
                            if (_model.uploadedFileUrl != '') {
                              unawaited(
                                () async {
                                  await CategoriesRecord.collection
                                      .doc()
                                      .set(createCategoriesRecordData(
                                        name: _model.textController.text,
                                        icon: _model.uploadedFileUrl != ''
                                            ? _model.uploadedFileUrl
                                            : widget.categoryItem?.icon,
                                        subcategoryOf: _model.switchValue!
                                            ? functions
                                                .getWomensMeditationsRef()
                                            : null,
                                        undeletable: false,
                                        isSubcategory: _model.switchValue,
                                        createdAt: getCurrentTimestamp,
                                      ));
                                }(),
                              );
                            } else {
                              _model.error =
                                  'Необходимо загрузить изображение!';
                              safeSetState(() {});
                              return;
                            }
                          }

                          Navigator.pop(context);
                        },
                  text: 'Сохранить',
                  options: FFButtonOptions(
                    width: double.infinity,
                    height: 40.0,
                    padding:
                        EdgeInsetsDirectional.fromSTEB(24.0, 0.0, 24.0, 0.0),
                    iconPadding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                    color: Color(0xFF1C1C1C),
                    textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                          fontFamily: 'Vela Sans',
                          color: Colors.white,
                          letterSpacing: 0.0,
                          useGoogleFonts: false,
                        ),
                    elevation: 0.0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1.0,
                    ),
                    borderRadius: BorderRadius.circular(14.0),
                    disabledColor: FlutterFlowTheme.of(context).secondaryText,
                    disabledTextColor: FlutterFlowTheme.of(context).primaryText,
                  ),
                ),
              ),
            ].divide(SizedBox(height: 15.0)),
          ),
        ),
      ),
    );
  }
}
