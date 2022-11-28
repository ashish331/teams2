import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/teams/bindings/teams_binding.dart';
import '../modules/teams/views/teams_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.TEAMS;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
     GetPage(
      name: _Paths.TEAMS,
      page: () => const TeamsView(),
      binding: TeamsBinding(),
    ),
  ];
}
