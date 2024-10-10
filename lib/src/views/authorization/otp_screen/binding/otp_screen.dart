import 'package:get/get.dart';

import 'package:flutter_setup/src/views/authorization/otp_screen/controller/otp_controller.dart';

class OtpScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpScreenController>(() => OtpScreenController());
  }
}
