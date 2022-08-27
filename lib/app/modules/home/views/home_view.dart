import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:test_mobile_dev/app/modules/add_update_feed/controllers/add_update_feed_controller.dart';
import 'package:test_mobile_dev/app/routes/app_pages.dart';
import 'package:test_mobile_dev/extensions/extensions.dart';
import 'package:test_mobile_dev/shared/shared.dart';
import 'package:test_mobile_dev/widgets/widgets.dart';

import '../../../data/models/feed_model.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GeneralPage(
      titleAppBar: const Text("Feed"),
      isArrowBack: false,
      onRefresh: () async {
        controller.initPage();
      },
      floatingButton: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: mainColor,
            shape: const CircleBorder(),
            fixedSize: const Size(50, 50)),
        onPressed: () {
          Get.toNamed(
            Routes.ADD_UPDATE_FEED,
          );
        },
        child: const Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      body: controller.obxCustom(
        (state) => ListView(
          padding: const EdgeInsets.symmetric(horizontal: defaultMargin),
          children: [
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(controller.feeds.length, (index) {
                  Feed feed = controller.feeds[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 15),
                    width: Get.width,
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(color: whiteColor, boxShadow: [
                      customShadow(),
                    ]),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          feed.title!,
                          style: blackTextFontTitleBold,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          feed.body!,
                          style: blackTextFont,
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: CustomButtonWidget(
                                title: "Edit",
                                textStyle: blackTextFontTitle,
                                primaryColor: greyColor2,
                                leading: const Icon(
                                  Icons.edit_outlined,
                                  color: blackColor,
                                ),
                                onTap: () {
                                  Get.toNamed(Routes.ADD_UPDATE_FEED,
                                      arguments: AddUpdateFeedArgument(feed));
                                },
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: CustomButtonWidget(
                                title: "Delete",
                                textStyle: blackTextFontTitle,
                                primaryColor: greyColor2,
                                leading: const Icon(
                                  Icons.delete_outline,
                                  color: blackColor,
                                ),
                                onTap: () {
                                  Get.dialog(
                                    ShowDialongComfirm(
                                      textMessage:
                                          'Are you sure you want to delete this data?',
                                      onConfirmOk: () {
                                        controller.deleteFeed(feed);
                                      },
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  );
                }),
              ),
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
        onRefreshData: () {},
      ),
    );
  }
}
