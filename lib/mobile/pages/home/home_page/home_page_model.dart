import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/backend/schema/enums/enums.dart';
import '/common/loading_component/loading_component_widget.dart';
import '/components/not_connected_component_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/mobile/pages/home/widgets/courses_for_you_block/courses_for_you_block_widget.dart';
import '/mobile/pages/home/widgets/hits_block/hits_block_widget.dart';
import '/mobile/pages/home/widgets/last_course_component/last_course_component_widget.dart';
import '/mobile/pages/home/widgets/last_meditation_component/last_meditation_component_widget.dart';
import '/mobile/pages/home/widgets/meditations_for_you_block/meditations_for_you_block_widget.dart';
import '/mobile/pages/home/widgets/podcasts_block/podcasts_block_widget.dart';
import '/mobile/pages/home/widgets/popular_and_new_block/popular_and_new_block_widget.dart';
import '/index.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  Local state fields for this page.

  List<CoursesRecord> courseDocs = [];
  void addToCourseDocs(CoursesRecord item) => courseDocs.add(item);
  void removeFromCourseDocs(CoursesRecord item) => courseDocs.remove(item);
  void removeAtIndexFromCourseDocs(int index) => courseDocs.removeAt(index);
  void insertAtIndexInCourseDocs(int index, CoursesRecord item) =>
      courseDocs.insert(index, item);
  void updateCourseDocsAtIndex(int index, Function(CoursesRecord) updateFn) =>
      courseDocs[index] = updateFn(courseDocs[index]);

  List<MeditationsRecord> meditationDocs = [];
  void addToMeditationDocs(MeditationsRecord item) => meditationDocs.add(item);
  void removeFromMeditationDocs(MeditationsRecord item) =>
      meditationDocs.remove(item);
  void removeAtIndexFromMeditationDocs(int index) =>
      meditationDocs.removeAt(index);
  void insertAtIndexInMeditationDocs(int index, MeditationsRecord item) =>
      meditationDocs.insert(index, item);
  void updateMeditationDocsAtIndex(
          int index, Function(MeditationsRecord) updateFn) =>
      meditationDocs[index] = updateFn(meditationDocs[index]);

  LoadingState? pageState = LoadingState.loading;

  ///  State fields for stateful widgets in this page.

  // Stores action output result for [Action Block - isNewUser] action in HomePage widget.
  bool? isNew;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<MeditationsRecord>? meditations;
  // Stores action output result for [Firestore Query - Query a collection] action in HomePage widget.
  List<CoursesRecord>? courses;
  // Stores action output result for [Backend Call - Read Document] action in HomePage widget.
  SubscriptionsRecord? sub;
  // Stores action output result for [Custom Action - subscriptionToJson] action in HomePage widget.
  dynamic json;
  // Model for CoursesForYouBlock component.
  late CoursesForYouBlockModel coursesForYouBlockModel;
  // Model for MeditationsForYouBlock component.
  late MeditationsForYouBlockModel meditationsForYouBlockModel;
  // Model for PopularAndNewBlock component.
  late PopularAndNewBlockModel popularAndNewBlockModel1;
  // Model for PodcastsBlock component.
  late PodcastsBlockModel podcastsBlockModel;
  // Model for PopularAndNewBlock component.
  late PopularAndNewBlockModel popularAndNewBlockModel2;
  // Model for HitsBlock component.
  late HitsBlockModel hitsBlockModel;
  // Model for LastMeditationComponent component.
  late LastMeditationComponentModel lastMeditationComponentModel;
  // Model for LastCourseComponent component.
  late LastCourseComponentModel lastCourseComponentModel;
  // Model for LoadingComponent component.
  late LoadingComponentModel loadingComponentModel;
  // Model for NotConnectedComponent component.
  late NotConnectedComponentModel notConnectedComponentModel;
  // Stores action output result for [Action Block - isNewUser] action in NotConnectedComponent widget.
  bool? isNewCopy;
  // Stores action output result for [Firestore Query - Query a collection] action in NotConnectedComponent widget.
  List<MeditationsRecord>? forceMeditations;
  // Stores action output result for [Backend Call - API (whois)] action in NotConnectedComponent widget.
  ApiCallResponse? forceWhoIsResponse;
  // Stores action output result for [Firestore Query - Query a collection] action in NotConnectedComponent widget.
  List<CoursesRecord>? forceCourses;
  // Stores action output result for [Backend Call - Read Document] action in NotConnectedComponent widget.
  SubscriptionsRecord? forceSub;
  // Stores action output result for [Custom Action - subscriptionToJson] action in NotConnectedComponent widget.
  dynamic forceJson;

  @override
  void initState(BuildContext context) {
    coursesForYouBlockModel =
        createModel(context, () => CoursesForYouBlockModel());
    meditationsForYouBlockModel =
        createModel(context, () => MeditationsForYouBlockModel());
    popularAndNewBlockModel1 =
        createModel(context, () => PopularAndNewBlockModel());
    podcastsBlockModel = createModel(context, () => PodcastsBlockModel());
    popularAndNewBlockModel2 =
        createModel(context, () => PopularAndNewBlockModel());
    hitsBlockModel = createModel(context, () => HitsBlockModel());
    lastMeditationComponentModel =
        createModel(context, () => LastMeditationComponentModel());
    lastCourseComponentModel =
        createModel(context, () => LastCourseComponentModel());
    loadingComponentModel = createModel(context, () => LoadingComponentModel());
    notConnectedComponentModel =
        createModel(context, () => NotConnectedComponentModel());
  }

  @override
  void dispose() {
    coursesForYouBlockModel.dispose();
    meditationsForYouBlockModel.dispose();
    popularAndNewBlockModel1.dispose();
    podcastsBlockModel.dispose();
    popularAndNewBlockModel2.dispose();
    hitsBlockModel.dispose();
    lastMeditationComponentModel.dispose();
    lastCourseComponentModel.dispose();
    loadingComponentModel.dispose();
    notConnectedComponentModel.dispose();
  }
}
