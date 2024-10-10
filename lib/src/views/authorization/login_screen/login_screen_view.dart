import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_setup/global/utils/validator.dart';
import 'package:flutter_setup/global/widgets/app_button.dart';
import 'package:flutter_setup/global/widgets/common_logo.dart';
import 'package:flutter_setup/src/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_setup/global/constant/resources/import_resources.dart';
import 'package:flutter_setup/global/widgets/custom_text_field.dart';
import 'package:flutter_setup/src/views/authorization/login_screen/controller/login_screen_controller.dart';

const ksHorizontalSpace15 = 15.0;
const ksVerticalSpace15 = 15.0;

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.loginScreenFormKey = GlobalKey<FormState>();

    return WillPopScope(
        onWillPop: () async {
          return await Get.offAllNamed(Routes.welcomeScreen);
        },
        child: Scaffold(
          backgroundColor: AppColors.kcPrimaryColor,
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
              child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: ksWidgetHorizontalSpace15,
                      vertical: ksWidgetVerticalSpace15),
                  child: Form(
                      key: controller.loginScreenFormKey,
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: ksBodyHorizontalSpace30),
                            InkWell(
                                onTap: () =>
                                    Get.offAllNamed(Routes.welcomeScreen),
                                child: Image.asset(AppAssets.icWhiteBack,
                                    width: 25, height: 25)),
                            const SizedBox(height: ksBodyHorizontalSpace30),
                            Text(R.strings.ksWelcomeBack,
                                style: AppStyles.txt32sizeWithW700),
                            SizedBox(height: Get.height * 0.001),
                            Text(R.strings.ksGladToSeeYou,
                                style: AppStyles.txt14sizeW600ckcWhite
                                    .copyWith(fontSize: 18)),
                            SizedBox(height: Get.height * 0.04),
                            buildEmailField(),
                            const SizedBox(height: ksVerticalSpace15),
                            buildPasswordField(),
                            const SizedBox(height: ksVerticalSpace15),
                            forgotPasswordComponent(),
                            SizedBox(height: Get.height * 0.05),
                            AppButton(
                                onTap: () => controller.loginValidation(),
                                btnText: R.strings.ksLoginButtonText),
                            SizedBox(height: Get.height * 0.03),
                            dontHaveAnAccountComponent(),
                            SizedBox(height: Get.height * 0.05),
                            const CommonLogo()
                          ])))),
        ));
  }

  forgotPasswordComponent() {
    return Align(
        alignment: Alignment.topRight,
        child: InkWell(
            onTap: () => Get.toNamed(Routes.forgetPasswordScreen),
            child: Text(R.strings.ksForgotPassword,
                style: AppStyles.txt14sizeWithW600Underline)));
  }

  dontHaveAnAccountComponent() {
    return Center(
        child: RichText(
            text: TextSpan(
                text: '${R.strings.ksDontHaveAnAccount} ',
                style: AppStyles.txt14sizeW600ckcWhite,
                children: <TextSpan>[
          TextSpan(
              text: R.strings.ksSignUp,
              style: AppStyles.txt14sizeWithW600Underline,
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Get.toNamed(Routes.signupScreen);
                })
        ])));
  }

  buildEmailField() {
    return AppTextField(
        isScreenTitle: true,
        hintText: R.strings.ksEmailOrPassword,
        onChanged: (value) {},
        errorText: '',
        validator: Validator.validateEmail,
        textEditingController: controller.emailTextEditingController,
        keyBoardType: TextInputType.emailAddress,
        textCapitalization: TextCapitalization.none);
  }

  buildPasswordField() {
    return Obx(() {
      return AppTextField(
          keyBoardType: TextInputType.text,
          textCapitalization: TextCapitalization.none,
          isPwd: controller.isShowPassword.value ? false : true,
          maxLines: 1,
          suffixIconPath: controller.isShowPassword.value
              ? AppAssets.passwordHide
              : AppAssets.passwordShow,
          onSuffixIconTap: () {
            controller.isShowPassword.value = !controller.isShowPassword.value;
          },
          onTap: () {},
          validator: Validator.passwordValid,
          textEditingController: controller.passwordTextEditingController,
          hintText: R.strings.ksPassword,
          onChanged: (value) {});
    });
  }
}
