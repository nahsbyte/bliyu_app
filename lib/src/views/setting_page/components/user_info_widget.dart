import 'package:flutter/material.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../../global/constant/resources/import_resources.dart';
import '../../../../global/widgets/circle_image_view.dart';

class UserInfoWidget extends StatelessWidget {
  const UserInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(
            top: ksWidgetVerticalSpace15, bottom: ksWidgetVerticalSpace15),
        child: Row(children: [
          InkWell(
              onTap: () {},
              child: const CircleImageView(
                  imgUrl:
                      'https://img.freepik.com/free-vector/businessman-character-avatar-isolated_24877-60111.jpg?w=740&t=st=1683006951~exp=1683007551~hmac=2fd06f517ef15e591196789f6c93eecdc5a3779af174d07919ce247af9b9fbe3',
                  backgroundColor: AppColors.kcTransparent)),
          const SizedBox(width: 5),
          const Expanded(
              child: Text('John Deo',
                  style: AppStyles.txt14sizeW600ckcWhite, maxLines: 3)),
          InkWell(
              onTap: () {
                Get.toNamed(Routes.editProfileScreen);
              },
              child: Image.asset(AppAssets.icEdit, height: Get.height * 0.03))
        ]));
  }
}
