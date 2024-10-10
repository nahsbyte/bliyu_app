import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import '../../../../../global/constant/resources/resources.dart';
import '../../../../../global/widgets/common_appbar_white.dart';
import '../../../authorization/select_language_screen/model/get_language_list_model.dart';
import 'controller/change_language_controller.dart';

class ChangeLanguageScreenView extends GetView<ChangeLanguageController> {
  const ChangeLanguageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => WillPopScope(
        onWillPop: controller.onWillPopTap,
        child: Scaffold(
            backgroundColor: AppColors.kcWhite,
            appBar: buildCommonWhiteAppbar(),
            body: Obx(() => Column(children: [topComponent()])))));
  }

  buildCommonWhiteAppbar() {
    return CommonWhiteAppbar(
        onTap: () {
          Get.offAllNamed(Routes.dashboardScreen);
        },
        appBar: AppBar(),
        title: R.strings.ksChangeLanguage);
  }

  topComponent() {
    return Align(
        alignment: Alignment.topCenter,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                vertical: ksBodyVerticalSpace15,
                horizontal: ksBodyHorizontalSpace15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [buildLanguageDropDown()])));
  }

  buildLanguageDropDown() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(R.strings.ksSelectLanguageHint,
          style: AppStyles.txt14sizeW600ckcWhite),
      SizedBox(height: Get.height * 0.02),
      Obx(() => Container(
          height: Get.height * 0.07,
          padding:
              const EdgeInsets.symmetric(horizontal: ksWidgetHorizontalSpace15),
          decoration: BoxDecoration(
              borderRadius:
                  BorderRadius.all(Radius.circular(Get.height * 0.01)),
              color: AppColors.kcInputFilled),
          child: buildDropdownButtonHideUnderline()))
    ]);
  }

  buildDropdownButtonHideUnderline() {
    return DropdownButtonHideUnderline(
        child: DropdownButton<LanguageData>(
            value: controller.selectedLanguage,
            icon: const Icon(Icons.keyboard_arrow_down,
                color: Colors.grey, size: 30),
            isExpanded: true,
            style: AppStyles.txt10sizeWithW700,
            onChanged: (LanguageData? data) {
              controller.selectedLanguageOnTap(item: data!);
            },
            hint: Text(R.strings.ksSelectLanguageHint,
                style: AppStyles.txt14sizeW500CaptionLightGray),
            items: controller.languageList.map((LanguageData data) {
              return DropdownMenuItem<LanguageData>(
                  value: data,
                  child: Text(data.langName!,
                      style: AppStyles.txt14sizeW500CaptionLightGray));
            }).toList()));
  }
}
