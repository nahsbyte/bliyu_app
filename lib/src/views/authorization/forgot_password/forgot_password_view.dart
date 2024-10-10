import 'package:flutter/material.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:flutter_setup/global/widgets/custom_text_field.dart';
import 'package:flutter_setup/global/widgets/vector_description_widget.dart';
import 'package:flutter_setup/src/views/authorization/forgot_password/controller/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.forgotPwdFormKey = GlobalKey<FormState>();
    return Scaffold(
        backgroundColor: AppColors.kcPrimaryColor,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: ksBodyHorizontalSpace15,
                    vertical: ksBodyVerticalSpace15),
                child: Form(
                    key: controller.forgotPwdFormKey,
                    child: Column(children: [
                      VectorDescriptionWidget(
                          imagePath: AppAssets.forgotPasswordVector,
                          description: R.strings.ksForgotPasswordParaText),
                      buildEmailField(),
                      SizedBox(height: Get.height * 0.04),
                      AppButton(
                          onTap: () => controller.validAll(),
                          btnText: R.strings.btnSend),
                      SizedBox(height: Get.height * 0.03),
                      const CommonLogo()
                    ])))));
  }

  buildEmailField() {
    return Padding(
        padding: const EdgeInsets.only(right: 2.0),
        child: AppTextField(
            isScreenTitle: true,
            hintText: R.strings.ksEmailHint,
            errorText: '',
            validator: Validator.validateEmail,
            textEditingController: controller.emailController,
            keyBoardType: TextInputType.emailAddress,
            textCapitalization: TextCapitalization.none));
  }
}
