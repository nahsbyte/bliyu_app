// ignore_for_file: unused_local_variable, non_constant_identifier_names

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/utils/utils.dart';

class LoginScreenController extends GetxController {
  var isShowPassword = false.obs;

  late GlobalKey<FormState> loginScreenFormKey;

  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController passwordTextEditingController = TextEditingController();

  String generateRandomString(int len) {
    var r = Random();
    const chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => chars[r.nextInt(chars.length)]).join();
  }

  loginValidation() {
    if (loginScreenFormKey.currentState!.validate()) {
      AppSession.setAccessToken(generateRandomString(30));
      Utils.successSnackBar(message: R.strings.scLoginMsg);
      Get.offAllNamed(Routes.dashboardScreen);
    } else {
      Logger.logPrint('invalidate');
    }
  }
}
