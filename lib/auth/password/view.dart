import 'package:flutter/material.dart';
import 'package:full_thimar_project/auth/forget_password/view.dart';
import 'package:full_thimar_project/auth/login/view.dart';
import 'package:get/get.dart';

import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_styles.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {

  bool isLoading = false;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 20),
          children: [
            const AppImage(
              AssetsData.logo,
              height: 126,
              width: 130,
            ),
            verticalSpace(20),
            Text(
              "33".tr,
              style: TextStyles.textStyle16Bold,
            ),
            verticalSpace(5),
            Text(
              "23".tr,
              style: TextStyles.textStyle16Light,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppInput(
                    labelText: "7".tr,
                    icon: AssetsData.phoneIcon,
                    type: TextInputType.phone,
                    onChanged: (value) {
                      setState(() {
                        phoneController.text = value;
                      });
                    },
                    validator: (value) {
                      if(value == null ||
                          value.isEmpty ||
                          !AppRegex.isPhoneNumberValid(value)){
                        return "6".tr;
                      }
                      return null;
                    },
                    controller: phoneController,
                    paddingTop: 28,
                    paddingBottom: 24,
                    isPhone: true,
                  ),
                ],
              ),
            ),
            isLoading ? const Center(
              child: CircularProgressIndicator(color: kPrimaryColor,),
            )
                :
            AppButton(
                text: "27".tr,
                onPress: (){
                  debugPrint(phoneController.text);
                  if(formKey.currentState!.validate()){
                    toGetNavigate(const ForgetPasswordScreen());
                    isLoading = true;
                    setState(() {

                    });
                  }
                }
            ),
            verticalSpace(45),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "22".tr,
                  style: TextStyles.textStyle15Bold,
                ),
                GestureDetector(
                  onTap: () {
                    toGetNavigate(const LoginScreen());
                  },
                  child: Text(
                    "11".tr,
                    style: TextStyles.textStyle18Bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
