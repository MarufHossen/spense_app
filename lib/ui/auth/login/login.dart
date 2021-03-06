import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spense_app/base/widget/central_progress_indicator.dart';
import 'package:spense_app/base/widget/custom_filled_button.dart';
import 'package:spense_app/base/widget/custom_text_form_field.dart';
import 'package:spense_app/constants.dart';
import 'package:spense_app/ui/auth/login/login_controller.dart';
import 'package:spense_app/ui/auth/registration/registration.dart';
import 'package:spense_app/ui/auth/registration/registration_binding.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: systemUiOverlayStyleGlobal.copyWith(
        systemNavigationBarColor: Colors.white,
      ),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: GetBuilder<LoginController>(
            id: "body",
            init: LoginController(),
            builder: (LoginController viewController) {
              return viewController.isLoading
                  ? CentralProgressIndicator()
                  : SingleChildScrollView(
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 20.0,
                                right: 20.0,
                                bottom: 28.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Get.back(result: false);
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.all(8.0),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: colorCloseButtonBackground,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        size: 20.0,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    width: double.maxFinite,
                                    child: Text(
                                      "welcome_app".tr,
                                      style: textStyleHeadline,
                                      textAlign: TextAlign.center,
                                    ).marginOnly(
                                      top: 16.0,
                                      bottom: 8.0,
                                    ),
                                  ),
                                  Text(
                                    "welcome_tagline".tr,
                                    style: textStyleLarge.copyWith(
                                      color: colorTextSecondary,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            CustomTextFormField(
                              formController: controller.emailController,
                              inputType: TextInputType.emailAddress,
                              hint: "email_address".tr,
                              iconPath: "images/ic_email.png",
                            ),
                            CustomTextFormField(
                              formController: controller.passwordController,
                              inputType: TextInputType.visiblePassword,
                              hint: "password".tr,
                              iconPath: "images/ic_lock.png",
                            ),
                            Container(
                              margin: const EdgeInsets.only(
                                top: 8.0,
                                left: 20.0,
                                right: 20.0,
                              ),
                              width: double.maxFinite,
                              child: GestureDetector(
                                onTap: () {},
                                child: Text(
                                  "forgot_password".tr,
                                  textAlign: TextAlign.end,
                                  style: textStyleLarge.copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: colorHighlight,
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                CustomFilledButton(
                                  title: "sign_in".tr,
                                  onTap: () {
                                    controller.login();
                                  },
                                  margin: const EdgeInsets.only(
                                    left: 20.0,
                                    right: 20.0,
                                    top: 40.0,
                                    bottom: 16.0,
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: "doesnt_have_account".tr + " ",
                                    style: textStyleRegular,
                                    children: [
                                      TextSpan(
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Get.to(
                                              () => RegistrationPage(),
                                              binding: RegistrationBinding(),
                                            );
                                          },
                                        text: "sign_up".tr,
                                        style: textStyleRegular.copyWith(
                                          fontWeight: FontWeight.w700,
                                          color: colorAccent,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
            },
          ),
        ),
      ),
    );
  }
}
