import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/app_localization/app_localization.dart';
import 'package:flutter_setup/global/preference/user_preference.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:flutter_setup/global/theme/light_theme.dart';
import 'package:flutter_setup/global/utils/config.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class FlutterBoilerPlateApp extends StatelessWidget {
  const FlutterBoilerPlateApp({super.key});

  @override
  Widget build(BuildContext context) {
    return OverlaySupport.global(
        child: AnnotatedRegion<SystemUiOverlayStyle>(
            value: const SystemUiOverlayStyle(
                systemNavigationBarColor: AppColors.kcPrimaryColor,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light,
                statusBarBrightness: Brightness.light),
            child: GetMaterialApp(
                title: Config.appName,
                locale: Locale(AppSession.getSelectedLanguageId()),
                localizationsDelegates: const [
                  AppLocalizationsDelegate(),
                  GlobalMaterialLocalizations.delegate,
                  GlobalWidgetsLocalizations.delegate,
                  GlobalCupertinoLocalizations.delegate
                ],
                supportedLocales: [
                  Locale(Config.langCodeEn, Config.langCountryCodeEn),
                  Locale(Config.langCodeRu, Config.langCountryCodeRu),
                  Locale(Config.langCodeFr, Config.langCountryCodeFr)
                ],
                debugShowCheckedModeBanner: false,
                theme: lightThemeData(context),
                initialRoute: Routes.splash,
                getPages: AppPages.routes)));
  }
}
