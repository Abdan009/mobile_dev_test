import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mobile_dev/app/controllers/user_controller.dart';
import 'package:test_mobile_dev/app/data/models/feed_model.dart';
import 'package:test_mobile_dev/app/modules/home/controllers/home_controller.dart';
import 'package:test_mobile_dev/shared/shared.dart';

class AddUpdateFeedController extends GetxController {
  final userController = Get.find<UserController>();
  final homeController = Get.find<HomeController>();
  var currentFeed = Rxn<Feed>();
  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      AddUpdateFeedArgument argument = Get.arguments;
      currentFeed.value = argument.feed;
      titleController.text = argument.feed.title!;
      bodyController.text = argument.feed.body!;
    }
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future posting() async {
    if (!(titleController.text.trim() != '' &&
        bodyController.text.trim() != '')) {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.info,
          message: 'Please fill in all the data first');
    } else {
      isLoading.value = true;
      if (Get.arguments == null) {
        Feed feed = Feed(
          title: titleController.text,
          body: bodyController.text,
          userId: userController.myUser.value!.id!,
        );
       await homeController.addFeed(feed);
      } else {
        Feed feed = currentFeed.value!.copyWith(
          title: titleController.text,
          body: bodyController.text,
        );
       await homeController.updateFeed(feed);
      }
      isLoading.value = false;
    }
  }
}

class AddUpdateFeedArgument {
  final Feed feed;
  AddUpdateFeedArgument(this.feed);
}
