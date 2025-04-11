import '/backend/schema/enums/enums.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/instant_timer.dart';
import '/web/screens/categories/categories_screen/categories_screen_widget.dart';
import '/web/screens/courses/courses_screen/courses_screen_widget.dart';
import '/web/screens/hits/hits_screen/hits_screen_widget.dart';
import '/web/screens/meditations/meditations_screen/meditations_screen_widget.dart';
import '/web/screens/meditations/womens_meditations_screen/womens_meditations_screen_widget.dart';
import '/web/screens/onboarding/onboarding_screen/onboarding_screen_widget.dart';
import '/web/screens/tiers/tiers_screen/tiers_screen_widget.dart';
import '/web/screens/users_screen/users_screen_widget.dart';
import '/index.dart';
import 'web_home_page_widget.dart' show WebHomePageWidget;
import 'package:flutter/material.dart';

class WebHomePageModel extends FlutterFlowModel<WebHomePageWidget> {
  ///  Local state fields for this page.

  String currentScreen = 'Главная';

  List<String> tabs = [
    'Онбординг',
    'Категории',
    'Курсы и медитации',
    'Женские медитации',
    'Хиты',
    'Подписки'
  ];
  void addToTabs(String item) => tabs.add(item);
  void removeFromTabs(String item) => tabs.remove(item);
  void removeAtIndexFromTabs(int index) => tabs.removeAt(index);
  void insertAtIndexInTabs(int index, String item) => tabs.insert(index, item);
  void updateTabsAtIndex(int index, Function(String) updateFn) =>
      tabs[index] = updateFn(tabs[index]);

  LoadingState? pageState = LoadingState.init;

  ///  State fields for stateful widgets in this page.

  InstantTimer? instantTimer;
  // Model for CategoriesScreen component.
  late CategoriesScreenModel categoriesScreenModel;
  // Model for OnboardingScreen component.
  late OnboardingScreenModel onboardingScreenModel;
  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for CoursesScreen component.
  late CoursesScreenModel coursesScreenModel;
  // Model for MeditationsScreen component.
  late MeditationsScreenModel meditationsScreenModel;
  // Model for UsersScreen component.
  late UsersScreenModel usersScreenModel;
  // Model for HitsScreen component.
  late HitsScreenModel hitsScreenModel;
  // Model for TiersScreen component.
  late TiersScreenModel tiersScreenModel;
  // Model for WomensMeditationsScreen component.
  late WomensMeditationsScreenModel womensMeditationsScreenModel;

  @override
  void initState(BuildContext context) {
    categoriesScreenModel = createModel(context, () => CategoriesScreenModel());
    onboardingScreenModel = createModel(context, () => OnboardingScreenModel());
    coursesScreenModel = createModel(context, () => CoursesScreenModel());
    meditationsScreenModel =
        createModel(context, () => MeditationsScreenModel());
    usersScreenModel = createModel(context, () => UsersScreenModel());
    hitsScreenModel = createModel(context, () => HitsScreenModel());
    tiersScreenModel = createModel(context, () => TiersScreenModel());
    womensMeditationsScreenModel =
        createModel(context, () => WomensMeditationsScreenModel());
  }

  @override
  void dispose() {
    instantTimer?.cancel();
    categoriesScreenModel.dispose();
    onboardingScreenModel.dispose();
    tabBarController?.dispose();
    coursesScreenModel.dispose();
    meditationsScreenModel.dispose();
    usersScreenModel.dispose();
    hitsScreenModel.dispose();
    tiersScreenModel.dispose();
    womensMeditationsScreenModel.dispose();
  }
}
