import 'package:get/get.dart';

import 'package:flutter_setup/src/views/authorization/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
