import 'package:get/get.dart';

import '../controllers/add_update_feed_controller.dart';

class AddUpdateFeedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddUpdateFeedController>(
      () => AddUpdateFeedController(),
    );
  }
}
