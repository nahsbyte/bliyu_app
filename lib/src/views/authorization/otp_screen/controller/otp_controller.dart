import 'package:flutter/cupertino.dart';
import 'package:flutter_setup/global/utils/logger.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/utils/utils.dart';

class OtpScreenController extends GetxController {
  TextEditingController otpController = TextEditingController();
  late GlobalKey<FormState> otpFormKey;

  validAll() {
    if (otpFormKey.currentState!.validate()) {
      Logger.logPrint('validate');
    } else {
      Logger.logPrint('invalidate');
    }
  }

  void otpValidation() async {
    if (otpFormKey.currentState!.validate()) {
      Logger.logPrint('validate');
    } else {
      Logger.logPrint('invalidate');
    }
  }
}
