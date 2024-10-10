import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_setup/global/dialog/common_dialog.dart';

class DialogueHelper {
  /// This dialog contains two button yes or no, so It's a confirmation dialogue
  /// It can be use in Logout , Deactivate account, delete account or any type of confirmation message scenario
  ///
  /// It is also dynamic dialogue so we can set button text according to our need.
  /// @Param positiveBtnText,cancelBtnText
  static showCommonDialogue(
      {required GestureTapCallback onPositiveClick,
      required VoidCallback onNegativeClick,
      required String positiveBtnText,
      description,
      String? title,
      required String cancelBtnText}) {
    Get.dialog(CommonDialog(
        description: description ?? '',
        negativeBtnText: cancelBtnText,
        onNegativeTap: onNegativeClick,
        onPositiveTap: onPositiveClick,
        positiveBtnText: positiveBtnText,
        title: title));
  }
}
