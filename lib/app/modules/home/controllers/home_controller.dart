import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_mobile_dev/app/controllers/user_controller.dart';
import 'package:test_mobile_dev/app/data/models/feed_model.dart';
import 'package:test_mobile_dev/app/data/providers/feed_provider.dart';
import 'package:test_mobile_dev/app/data/providers/user_provider.dart';
import 'package:test_mobile_dev/shared/shared.dart';
import 'package:test_mobile_dev/widgets/widgets.dart';

class HomeController extends GetxController with StateMixin {
  final userController = Get.put(UserController());

  var feeds = List<Feed>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    initPage();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future initPage() async {
    try {
      change(null, status: RxStatus.loading());
      await userController.getMyUser();
      await getFeeds();
      change(feeds, status: RxStatus.success());
    } on Exception catch (e) {
      e.printError();
      change(null, status: RxStatus.error(e.toString()));
    }
  }

  Future getFeeds() async {
    var result = await FeedProvider().getPosts();
    if (result.value != null) {
      feeds.value = result.value;
    } else {
      throw Exception(result.message!);
    }
  }

  Future addFeed(Feed feed) async {
    var result = await FeedProvider().addFeed(feed);
    if (result.value != null) {
      feeds.insert(0, result.value);
      Get.back();
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success,
          message: "Feed added successfully");
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success, message: result.message!);
    }
  }

  Future updateFeed(Feed feed) async {
    var result = await FeedProvider().updateFeed(feed);
    if (result.value != null) {
      feeds.value = feeds.map((element) {
        if (element.id == feed.id) {
          return result.value as Feed;
        } else {
          return element;
        }
      }).toList();
      Get.back();
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success,
          message: "Feed changed successfully");
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success, message: result.message!);
    }
  }

  Future deleteFeed(Feed feed) async {
    Get.back();
    Get.dialog(
     const ShowLoadingDialog()
    );
    var result = await FeedProvider().deleteFeed(feed);
    if (result.value != null) {
      feeds.value = feeds.where((p0) => p0.id != feed.id).toList();
      Get.back();
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success,
          message: "Feed deleted successfully");
    } else {
      snackbarCustom(
          typeSnackbar: TypeSnackbar.success, message: result.message!);
    }
  }
}
