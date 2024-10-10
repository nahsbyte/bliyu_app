import 'package:get/get.dart';

import 'package:flutter_setup/src/views/authorization/onboard/controller/onboard_controller.dart';

class OnBoardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OnBoardController>(() => OnBoardController());
  }
}
