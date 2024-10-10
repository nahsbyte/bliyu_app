import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/authorization/onboard/model/on_board_item_model.dart';

class OnBoardController extends GetxController {
  PageController pageController = PageController();
  RxList<OnBoardItemModel> onboardItemList = <OnBoardItemModel>[
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 1',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 1'),
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 2',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 2'),
    OnBoardItemModel(
        title: '${R.strings.ksTitle} 3',
        imgPath: AppAssets.introVector1,
        description: '${R.strings.ksDescription} 3'),
  ].obs;

  var selectedIndicator = 0.obs;

  changeIndicator({required index}) {
    selectedIndicator.value = index;
  }

  skipNextTapped() {
    AppSession.setIsIntroScreenDone(true);
    Get.offAllNamed(Routes.welcomeScreen);
  }

  onNextTap() {
    if (selectedIndicator.value == onboardItemList.length - 1) {
      skipNextTapped();
    } else {
      pageController.nextPage(
          duration: const Duration(seconds: 1), curve: Curves.ease);
    }
  }
}
