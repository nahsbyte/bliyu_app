import 'package:flutter/material.dart';

import 'package:flutter_setup/global/constant/resources/import_resources.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SizedBox.expand(
          child: Image.asset(AppAssets.welcomeBg4x, fit: BoxFit.fill)),
      Center(
          child: Padding(
              padding: const EdgeInsets.all(ksBodyVerticalSpace30),
              child: Image.asset(AppAssets.appLogo)))
    ]);
  }
}
