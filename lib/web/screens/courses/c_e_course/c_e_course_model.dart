import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'c_e_course_widget.dart' show CECourseWidget;
import 'package:flutter/material.dart';

class CECourseModel extends FlutterFlowModel<CECourseWidget> {
  ///  Local state fields for this component.

  String? errors;

  List<LessonStruct> lessonsList = [];
  void addToLessonsList(LessonStruct item) => lessonsList.add(item);
  void removeFromLessonsList(LessonStruct item) => lessonsList.remove(item);
  void removeAtIndexFromLessonsList(int index) => lessonsList.removeAt(index);
  void insertAtIndexInLessonsList(int index, LessonStruct item) =>
      lessonsList.insert(index, item);
  void updateLessonsListAtIndex(int index, Function(LessonStruct) updateFn) =>
      lessonsList[index] = updateFn(lessonsList[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode1;
  TextEditingController? textController1;
  String? Function(BuildContext, String?)? textController1Validator;
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode2;
  TextEditingController? textController2;
  String? Function(BuildContext, String?)? textController2Validator;
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for DropDown widget.
  List<String>? dropDownValue1;
  FormFieldController<List<String>>? dropDownValueController1;
  // State field(s) for DropDown widget.
  List<String>? dropDownValue2;
  FormFieldController<List<String>>? dropDownValueController2;
  // Stores action output result for [Bottom Sheet - CELesson] action in Icon widget.
  List<LessonStruct>? editedLesson;
  // Stores action output result for [Bottom Sheet - CELesson] action in Button widget.
  List<LessonStruct>? lessons;
  // State field(s) for Switch widget.
  bool? switchValue1;
  // State field(s) for Switch widget.
  bool? switchValue2;
  // Stores action output result for [Backend Call - Read Document] action in Button widget.
  CoursesRecord? editedDoc;
  // Stores action output result for [Backend Call - Create Document] action in Button widget.
  CoursesRecord? doc;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    textFieldFocusNode1?.dispose();
    textController1?.dispose();

    textFieldFocusNode2?.dispose();
    textController2?.dispose();
  }
}
