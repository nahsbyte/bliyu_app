import 'package:flutter/material.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/widgets/app_background.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:flutter_setup/src/views/authorization/welcome_screen/controller/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: Stack(children: [const AppBackground(), bottomComponent()]));
  }

  bottomComponent() {
    return Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: ksWidgetHorizontalSpace15,
            vertical: ksWidgetVerticalSpace15),
        child: Column(mainAxisAlignment: MainAxisAlignment.end, children: [
          AppButton(
              onTap: () => Get.offAllNamed(Routes.loginScreen),
              btnText: R.strings.ksLoginButtonText),
          const SizedBox(height: ksWidgetVerticalSpace15),
          AppButton(
              onTap: () => Get.offAllNamed(Routes.signupScreen),
              btnBgColor: AppColors.kcPrimaryColor,
              buttonTextStyle: AppStyles.txt14sizeW600ckcWhite,
              btnText: R.strings.ksSignup,
              borderColor: AppColors.kcWhite),
          const SizedBox(height: ksWidgetVerticalSpace15)
        ]));
  }
}
