import 'package:flutter/material.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/global/widgets/app_background.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/global/widgets/common_dropdown.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/authorization/select_language_screen/controller/select_language_controller.dart';
import 'package:flutter_setup/src/views/authorization/select_language_screen/model/get_language_list_model.dart';

class SelectLanguageScreenView extends GetView<SelectLanguageController> {
  const SelectLanguageScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: Obx(() {
          return Stack(children: [const AppBackground(), languageBodyView()]);
        }));
  }

  languageBodyView() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            vertical: ksWidgetVerticalSpace15,
            horizontal: ksWidgetHorizontalSpace15),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          buildLanguageDropDown(),
          const SizedBox(height: ksBodyVerticalSpace30),
          AppButton(
            btnText: R.strings.btnNext,
            onTap: () {
              if (controller.selectedLanguage.value.langId == '-1') {
                Utils.errorSnackBar(message: R.strings.erSelectLanguageMsg);
              }
              if (!AppSession.isIntroScreenDone()) {
                Get.toNamed(Routes.onBoard);
              } else {
                Get.toNamed(Routes.welcomeScreen);
              }
            },
          ),
          const SizedBox(height: ksBodyVerticalSpace30)
        ]));
  }

  buildLanguageDropDown() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(R.strings.hnSelectLanguage, style: AppStyles.txt14sizeW600ckcWhite),
      const SizedBox(height: ksWidgetVerticalSpace15),
      Obx(() => CommonDropDownWidget(
          onChanged: (data) {
            controller.selectedLanguage.value = data!;
            controller.selectedLanguageName.value = data.langName.toString();
            Config.setLocale.value =
                controller.selectedLanguage.value.langCode.toString();
            AppSession.setSelectedLanguageId(Config.setLocale.value);
            Get.updateLocale(Locale(Config.setLocale.value));
            controller.update();
          },
          items: controller.languageList.map((LanguageData genre) {
            return DropdownMenuItem<LanguageData>(
                value: genre,
                child: Text(genre.langName!,
                    style: AppStyles.txt14sizeW500CaptionLightGray));
          }).toList(),
          hintText: R.strings.hnSelectLanguage,
          value: controller.selectedLanguage.value.langId != '-1'
              ? controller.selectedLanguage.value
              : null))
    ]);
  }
}
