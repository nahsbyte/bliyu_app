import 'package:flutter_setup/global/app_localization/app_localization.dart';

///Extensions on string can be added here
extension TranslateString on String {
  String toTranslate() {
    return AppLocalizations().getText(this);
  }
}
