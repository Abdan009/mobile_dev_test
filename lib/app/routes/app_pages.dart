import 'package:get/get.dart';

import '../modules/add_update_feed/bindings/add_update_feed_binding.dart';
import '../modules/add_update_feed/views/add_update_feed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_UPDATE_FEED,
      page: () => const AddUpdateFeedView(),
      binding: AddUpdateFeedBinding(),
    ),
  ];
}
