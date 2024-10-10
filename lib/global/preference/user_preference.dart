import 'package:flutter_setup/global/preference/session_keys.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///TO manage Logged in user's session
class AppSession {
  static GetStorage? sessionData;
  static GetStorage? introScreenData;

  static void init() {
    introScreenData = GetStorage();

    sessionData = GetStorage();
  }

  static void clearStorage() {
    sessionData!.erase();
    init();
  }

  static void setSelectedLanguageId(String? value) {
    sessionData!.write(UserSessionDetail.kSelectedLanguageId, value);
  }

  static String getSelectedLanguageId() {
    return sessionData?.read(UserSessionDetail.kSelectedLanguageId) ??
        Config.langCodeEn;
  }

  static void setAccessToken(String? value) {
    sessionData!.write(UserSessionDetail.kAccessToken, value);
  }

  static String getAccessToken() {
    return sessionData?.read(UserSessionDetail.kAccessToken) ?? '';
  }

  static bool isAuthenticationDone() {
    bool isAuthDone = AppSession.getAccessToken().isNotEmpty &&
        AppSession.getAccessToken() != '';
    if (isAuthDone) {
      return true;
    }
    return isAuthDone;
  }

  static bool isIntroScreenDone() {
    return introScreenData!.read(UserSessionDetail.kIsIntroScreenDone) ?? false;
  }

  static setIsIntroScreenDone(bool isDone) {
    introScreenData!.write(UserSessionDetail.kIsIntroScreenDone, isDone);
  }

  static Future<void> logoutUser() async {
    AppSession.clearStorage();
    AppSession.init();
    AppSession.setAccessToken("");
    Get.offAllNamed(Routes.loginScreen);
  }
}
