import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_setup/global/constant/resources/assets.dart';
import 'package:flutter_setup/global/constant/resources/colors.dart';
import 'package:flutter_setup/global/constant/resources/resources.dart';
import 'package:flutter_setup/global/constant/resources/styles.dart';
import 'package:flutter_setup/global/utils/utils.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:flutter_setup/global/widgets/common_appbar_white.dart';
import 'package:flutter_setup/global/widgets/custom_text_field.dart';
import 'package:flutter_setup/global/widgets/user_profile_view.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'controller/edit_profile_controller.dart';

var _ksWidgetVerticalSpace = Get.height * 0.02;

class EditProfileView extends GetView<EditProfileController> {
  final EditProfileController editProfileController =
      Get.put(EditProfileController());

  EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.editProfileFormKey = GlobalKey<FormState>();
    return WillPopScope(
        onWillPop: controller.onWillPopTap,
        child: Scaffold(
            appBar: buildCommonWhiteAppbar(),
            body: SingleChildScrollView(child: buildEditView())));
  }

  Container buildEditView() {
    return Container(
        color: AppColors.kcWhite,
        child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: ksBodyHorizontalSpace15,
                vertical: ksBodyVerticalSpace15),
            child: Obx(() => Form(
                key: controller.editProfileFormKey,
                child: Column(children: [
                  UserProfile(
                      selectedFile: controller.selectedFile,
                      networkImg: controller.networkImg),
                  SizedBox(height: Get.height * 0.03),
                  buildNameField(),
                  SizedBox(height: _ksWidgetVerticalSpace),
                  buildEmailField(),
                  SizedBox(height: _ksWidgetVerticalSpace),
                  buildUsernameField(),
                  SizedBox(height: _ksWidgetVerticalSpace),
                  buildPhoneField(),
                  SizedBox(height: _ksWidgetVerticalSpace),
                  buildAddressField(),
                  SizedBox(height: _ksWidgetVerticalSpace),
                  buildOfficeAddressField(),
                  SizedBox(height: Get.height * 0.048),
                  buildButton(),
                  SizedBox(height: Get.height * 0.048),
                ])))));
  }

  Row buildNameField() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildFirstNameField(),
          SizedBox(width: Get.width * 0.05),
          buildLastNameField()
        ]);
  }

  CommonWhiteAppbar buildCommonWhiteAppbar() {
    return CommonWhiteAppbar(
        appBar: AppBar(),
        backgroundColor: AppColors.kcWhite,
        title: R.strings.ksEditProfileAppbarTitle,
        onTap: () {
          Get.offAllNamed(Routes.dashboardScreen);
        });
  }

  buildAdditionalTextField(
      {required TextEditingController textController,
      required String hintText}) {
    return AppTextField(
        cursorcolor: AppColors.kcBlack,
        textStyle: AppStyles.txt14sizeW500CaptionLightGray,
        textEditingController: textController,
        onChanged: (value) {},
        maxLines: 4,
        hintText: hintText,
        keyBoardType: TextInputType.multiline,
        textCapitalization: TextCapitalization.none);
  }

  buildFirstNameField() {
    return Expanded(
      child: AppTextField(
          maxLines: 1,
          fillColor: AppColors.kcInputFilled,
          textStyle: AppStyles.txt14sizeWithW500HintGrey,
          hintText: R.strings.ksEditProfileNameHint,
          errorText: "",
          cursorcolor: AppColors.kcGray,
          textEditingController: controller.firstNameController,
          validator: Validator.validateFirstName,
          onChanged: (value) {},
          inputAction: TextInputAction.next,
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none),
    );
  }

  buildLastNameField() {
    return Expanded(
        child: AppTextField(
            maxLines: 1,
            fillColor: AppColors.kcInputFilled,
            textStyle: AppStyles.txt14sizeWithW500HintGrey,
            hintText: R.strings.ksEditProfileLNameHint,
            errorText: "",
            textEditingController: controller.lastNameController,
            validator: Validator.validLastName,
            cursorcolor: AppColors.kcGray,
            onChanged: (value) {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.none));
  }

  buildEmailField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: AppColors.kcInputFilled,
            textStyle: AppStyles.txt14sizeWithW500HintGrey,
            hintText: R.strings.ksEditProfileEmailHint,
            errorText: "",
            cursorcolor: AppColors.kcGray,
            textEditingController: controller.emailController,
            onChanged: (value) {},
            suffixIconPath: AppAssets.icEdit,
            onSuffixIconTap: () {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none));
  }

  buildUsernameField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: AppColors.kcInputFilled,
            textStyle: AppStyles.txt14sizeWithW500HintGrey,
            hintText: R.strings.ksEditProfileUserNameHint,
            errorText: "",
            cursorcolor: AppColors.kcGray,
            inputFormatter: [FilteringTextInputFormatter.deny(RegExp('[ ]'))],
            textEditingController: controller.userNameController,
            validator: Validator.validateUserName,
            onChanged: (value) {},
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.none));
  }

  buildPhoneField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: Column(children: [
          Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Expanded(
                flex: 22,
                child: AppTextField(
                    maxLines: 1,
                    fillColor: AppColors.kcInputFilled,
                    onTap: () {
                      controller.openCountryBottomSheet();
                    },
                    textStyle: AppStyles.txt14sizeWithW500HintGrey,
                    hintText: R.strings.ksEditProfileCountryCodeHint,
                    errorText: "",
                    cursorcolor: AppColors.kcGray,
                    onChanged: (value) {},
                    textEditingController: controller.countryCodeController,
                    isReadOnly: true,
                    inputAction: TextInputAction.next,
                    keyBoardType: TextInputType.phone,
                    textCapitalization: TextCapitalization.none)),
            SizedBox(width: Get.width * 0.03),
            Expanded(
                flex: 73,
                child: AppTextField(
                    maxLines: 1,
                    fillColor: AppColors.kcInputFilled,
                    textStyle: AppStyles.txt14sizeWithW500HintGrey,
                    hintText: R.strings.ksEditProfilePhoneHint,
                    errorText: "",
                    cursorcolor: AppColors.kcGray,
                    textEditingController: controller.contactNumberController,
                    validator: Validator.validNumber,
                    onChanged: (value) {},
                    inputAction: TextInputAction.next,
                    keyBoardType: TextInputType.number,
                    textCapitalization: TextCapitalization.none))
          ])
        ]));
  }

  buildAddressField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: AppColors.kcInputFilled,
            textEditingController: controller.homeAddressController,
            textStyle: AppStyles.txt14sizeWithW500HintGrey,
            hintText: R.strings.ksEditProfileAddressHint,
            errorText: "",
            cursorcolor: AppColors.kcGray,
            validator: Validator.validHomeAddress,
            onChanged: (value) {},
            onTap: () {},
            suffixIconPath: AppAssets.icLocationIcon,
            onSuffixIconTap: () {},
            keyBoardType: TextInputType.text,
            inputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.none));
  }

  buildOfficeAddressField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2),
        child: AppTextField(
            maxLines: 1,
            fillColor: AppColors.kcInputFilled,
            textStyle: AppStyles.txt14sizeWithW500HintGrey,
            textEditingController: controller.officeAddressController,
            hintText: R.strings.ksEditProfileOfficeAddressHint,
            errorText: "",
            cursorcolor: AppColors.kcGray,
            onChanged: (value) {},
            onTap: () {},
            suffixIconPath: AppAssets.icLocationIcon,
            onSuffixIconTap: () {},
            validator: Validator.validOfficeAddress,
            inputAction: TextInputAction.next,
            keyBoardType: TextInputType.text,
            textCapitalization: TextCapitalization.none));
  }

  buildButton() {
    return AppButton(
        btnText: R.strings.ksEditProfileButtonText,
        onTap: () {
          if (controller.editProfileFormKey.currentState!.validate()) {
            Get.back();
          } else {
            Utils.errorSnackBar(message: R.strings.ksFillAlldetails);
          }
        });
  }
}
