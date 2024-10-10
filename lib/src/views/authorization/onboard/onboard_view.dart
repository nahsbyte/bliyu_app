import 'package:flutter/material.dart';
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:flutter_setup/src/views/authorization/onboard/components/dot_indicator_item.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/src/views/authorization/onboard/components/page_view_item.dart';
import 'package:flutter_setup/src/views/authorization/onboard/controller/onboard_controller.dart';

const ksWidgetHorizontalSpace15 = 15.0;
const ksWidgetVerticalSpace15 = 15.0;
const ksWidgetVerticalSpace40 = 40.0;

class OnBoardView extends GetView<OnBoardController> {
  const OnBoardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: SafeArea(
            child: ColoredBox(
                color: AppColors.kcPrimaryColor,
                child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: ksBodyHorizontalSpace15,
                        vertical: ksBodyVerticalSpace15),
                    child: Column(children: [
                      pageViewWidget(),
                      dotIndicatorWidget(),
                      const SizedBox(height: ksWidgetVerticalSpace15),
                      const CommonLogo()
                    ])))));
  }

  pageViewWidget() {
    return Obx(() {
      return Expanded(
          child: PageView.builder(
              controller: controller.pageController,
              onPageChanged: (index) {
                controller.changeIndicator(index: index);
              },
              itemCount: controller.onboardItemList.length,
              itemBuilder: (context, index) {
                return PageViewItem(
                    onBoardItemModel: controller.onboardItemList[index]);
              }));
    });
  }

  dotIndicatorWidget() {
    return Obx(() {
      return Row(children: [
        SizedBox(
            height: 30,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: controller.onboardItemList.length,
                itemBuilder: (context, index) {
                  return DotIndicatorItem(
                      innerDotColor: controller.selectedIndicator.value == index
                          ? AppColors.kcWhite
                          : AppColors.kcCaptionLightGray,
                      outerDotColor: controller.selectedIndicator.value == index
                          ? AppColors.kcCaptionLightGray.withOpacity(0.3)
                          : AppColors.kcTransparent);
                })),
        const Spacer(),
        skipButton(),
        const SizedBox(width: ksWidgetHorizontalSpace15),
        nextButton()
      ]);
    });
  }

  InkWell nextButton() {
    return InkWell(
        onTap: () => controller.onNextTap(),
        child: Container(
            padding: const EdgeInsets.symmetric(
                horizontal: ksWidgetHorizontalSpace15,
                vertical: ksWidgetVerticalSpace15),
            decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.all(Radius.circular(Get.width * 0.2)),
                color: AppColors.kcCaptionLightGray.withOpacity(0.2)),
            child: Center(
                child: Text(R.strings.ksNext,
                    style: AppStyles.txt18sizeWithW600
                        .copyWith(color: AppColors.kcWhite)))));
  }

  Visibility skipButton() {
    return Visibility(
      visible: controller.selectedIndicator.value !=
          controller.onboardItemList.length - 1,
      child: InkWell(
          child: Text(R.strings.ksSkip,
              style: AppStyles.txt14sizeW600ckcWhite
                  .copyWith(color: AppColors.kcYellow)),
          onTap: () => controller.skipNextTapped()),
    );
  }
}
