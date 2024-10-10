import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class DrawerModel {
  final String icon;
  final String title;
  String? path;
  final int selectedTile;

  DrawerModel(
      {required this.icon,
      required this.title,
      this.path,
      required this.selectedTile});
}

List<DrawerModel> getTopDrawerList() {
  return [
    DrawerModel(
        icon: AppAssets.icLanguage,
        title: R.strings.ksChangeLanguage,
        selectedTile: 0),
    DrawerModel(
        icon: AppAssets.icGithub, title: R.strings.ksGitHub, selectedTile: 1),
    DrawerModel(
        icon: AppAssets.icMore, title: R.strings.ksMore, selectedTile: 2)
  ];
}

List<DrawerModel> getBottomDrawerList() {
  return [
    DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksDeleteAccount,
        selectedTile: 0),
    DrawerModel(
        icon: AppAssets.icDeactivateAccount,
        title: R.strings.ksDeactivateAccount,
        selectedTile: 1),
    DrawerModel(
        icon: AppAssets.icLogout, title: R.strings.ksLogOut, selectedTile: 2)
  ];
}
