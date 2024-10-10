import 'package:flutter/material.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/utils/config.dart';

class CommonDialog extends StatelessWidget {
  final String? positiveBtnText, negativeBtnText, title;
  final String description;
  final VoidCallback? onPositiveTap, onNegativeTap;

  const CommonDialog(
      {Key? key,
      this.title,
      this.positiveBtnText,
      this.negativeBtnText,
      required this.description,
      this.onPositiveTap,
      this.onNegativeTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
            child: SingleChildScrollView(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
              Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        buildDialogueHeader(),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: ksWidgetHorizontalSpace15,
                                vertical: ksWidgetVerticalSpace15),
                            child: Column(children: [
                              buildDesc(description: description),
                              const SizedBox(height: ksBodyVerticalSpace30),
                              buildBtn(),
                              const SizedBox(height: ksWidgetVerticalSpace15)
                            ]))
                      ]))
            ]))));
  }

  buildDesc({required String description}) {
    return Center(
        child: Text(description,
            textAlign: TextAlign.center,
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 15,
                color: AppColors.kcCaptionLightGray)));
  }

  buildBtn() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: AppButton(
              btnText: positiveBtnText ?? R.strings.btnYes,
              onTap: onPositiveTap)),
      SizedBox(width: Get.width * 0.08),
      Expanded(
          child: AppButton(
              btnBgColor: AppColors.kcWhite,
              btnText: negativeBtnText ?? R.strings.btnNo,
              onTap: onNegativeTap ?? () => Get.back(),
              borderColor: AppColors.kcPrimaryColor))
    ]);
  }

  buildDialogueHeader() {
    return ListTile(
        title: Center(
            child: Text(title == null ? Config.appName : title!,
                style: AppStyles.txt16sizeW600CaptionLightGray
                    .copyWith(color: AppColors.kcBlack))),
        trailing: InkWell(
            onTap: () => Get.back(),
            child: const Padding(
                padding: EdgeInsets.only(bottom: 10.0),
                child: Icon(Icons.clear,
                    size: 25, color: AppColors.kcCaptionLightGray))));
  }
}
