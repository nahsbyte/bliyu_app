import 'package:get/get.dart';

import 'package:flutter_setup/src/views/authorization/select_language_screen/controller/select_language_controller.dart';

class SelectLanguageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectLanguageController>(() => SelectLanguageController());
  }
}
