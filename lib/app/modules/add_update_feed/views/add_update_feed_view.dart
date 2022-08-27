import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_mobile_dev/shared/shared.dart';
import 'package:test_mobile_dev/widgets/widgets.dart';

import '../controllers/add_update_feed_controller.dart';

class AddUpdateFeedView extends GetView<AddUpdateFeedController> {
  const AddUpdateFeedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      titleAppBar: Text(
          (controller.currentFeed.value != null) ? "Update Feed" : "Add Feed"),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
        children: [
          const SizedBox(
            height: 20,
          ),
          FieldCustomWidget(
            title: "Title",
            hint: "Enter title",
            controller: controller.titleController,
          ),
          const SizedBox(
            height: 20,
          ),
          FieldCustomWidget(
            title: "Body",
            hint: "Enter body",
            controller: controller.bodyController,
            maxLine: 30,
            height: 150,
          ),
          const SizedBox(
            height: 50,
          ),
          Obx(
            () => CustomButtonWidget(
              title: "Posting",
              padding: const EdgeInsets.symmetric(vertical: 10),
              onTap: controller.posting,
              isLoading: controller.isLoading.value,
            ),
          ),
        ],
      ),
    );
  }
}
