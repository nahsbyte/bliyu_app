part of 'app_pages.dart';

abstract class Routes {
  Routes._();

  static const splash = _Paths.splash;
  static const onBoard = _Paths.onBoard;
  static const selectLanguage = _Paths.selectLanguage;
  static const welcomeScreen = _Paths.welcomeScreen;
  static const loginScreen = _Paths.loginScreen;
  static const signupScreen = _Paths.signupScreen;
  static const forgetPasswordScreen = _Paths.forgetPasswordScreen;
  static const otpScreen = _Paths.otpScreen;
  static const dashboardScreen = _Paths.dashboardScreen;

  static const homeScreen = _Paths.homeScreen;
  static const settingScreen = _Paths.settingScreen;
  static const editProfileScreen = _Paths.editProfileScreen;
  static const moreScreen = _Paths.moreScreen;
  static const termsPrivacyScreen = _Paths.termsPrivacyScreen;
  static const changeLanguageScreen = _Paths.changeLanguageScreen;
}

abstract class _Paths {
  _Paths._();

  static const splash = '/splash';
  static const onBoard = '/onBoard';
  static const selectLanguage = '/selectLanguage';
  static const welcomeScreen = '/welcomeScreen';
  static const loginScreen = '/loginScreen';
  static const signupScreen = '/signupScreen';
  static const forgetPasswordScreen = '/forgetPasswordScreen';
  static const otpScreen = '/otpScreen';
  static const dashboardScreen = '/dashboardScreen';
  static const homeScreen = '/homeScreen';
  static const settingScreen = '/settingScreen';
  static const editProfileScreen = '/editProfileScreen';
  static const moreScreen = '/moreScreen';
  static const termsPrivacyScreen = '/termsPrivacyScreen';
  static const changeLanguageScreen = '/changeLanguageScreen';
}
