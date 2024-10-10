import 'package:get/get.dart';

import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_setup/src/views/authorization/select_language_screen/model/get_language_list_model.dart';

class SelectLanguageController extends GetxController {
  RxList<LanguageData> languageList = <LanguageData>[
    LanguageData(langId: '1', langName: 'English', langCode: Config.langCodeEn),
    LanguageData(langId: '2', langName: 'French', langCode: Config.langCodeFr),
    LanguageData(langId: '3', langName: 'Russian', langCode: Config.langCodeRu)
  ].obs;
  var selectedLanguage = LanguageData(langId: '-1').obs;
  RxString selectedLanguageName = ''.obs;
}
