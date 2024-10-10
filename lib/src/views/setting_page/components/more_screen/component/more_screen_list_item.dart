import 'package:flutter/material.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/widgets/common_widgets.dart';
import 'package:flutter_setup/src/views/setting_page/components/more_screen/model/more_menu_model.dart';
import 'package:get/get.dart';

var _ksWidgetVerticalSpace = Get.height * 0.02;

class MoreScreenListItem extends StatelessWidget {
  final MoreMenuModel menuItem;
  final GestureTapCallback? onTap;

  const MoreScreenListItem({Key? key, required this.menuItem, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Column(children: [
          SizedBox(height: _ksWidgetVerticalSpace),
          Container(
              margin: EdgeInsets.only(left: Get.width * 0.02),
              child: Row(children: [
                Expanded(
                    child: Text(menuItem.title,
                        style: AppStyles.txt12sizeW600ColorPrimary))
              ])),
          SizedBox(height: _ksWidgetVerticalSpace),
          const BuildGreyDivider(opacity: 0.2)
        ]));
  }
}
