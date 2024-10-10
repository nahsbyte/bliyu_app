import 'package:flutter/material.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/utils/utils.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();
  late GlobalKey<FormState> forgotPwdFormKey;
  var emailController = TextEditingController();

  validAll() {
    if (forgotPwdFormKey.currentState!.validate()) {
      Logger.logPrint('validate');
      Get.toNamed(Routes.otpScreen);
    } else {
      Logger.logPrint('invalidate');
    }
  }
}
