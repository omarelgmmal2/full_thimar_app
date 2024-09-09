import 'package:flutter/material.dart';
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
import '../login/view.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {

  bool isLoading = false;
  bool isSuccess = false;
  final formKey = GlobalKey<FormState>();
  final controller = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
              "34".tr,
              style: TextStyles.textStyle16Light,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  AppInput(
                    labelText: "9".tr,
                    icon: AssetsData.passwordIcon,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "8".tr;
                      }
                      return null;
                    },
                    controller: passwordController,
                    isPassword: true,
                    paddingTop: 28,
                  ),
                  AppInput(
                    labelText: "19".tr,
                    icon: AssetsData.passwordIcon,
                    type: TextInputType.visiblePassword,
                    validator: (value) {
                      if (value == null ||
                          value != passwordController.text ||
                          value.isEmpty ||
                          !AppRegex.isPasswordValid(value)) {
                        return "20".tr;
                      }
                      return null;
                    },
                    controller: confirmPasswordController,
                    isPassword: true,
                    paddingBottom: 19,
                  ),
                ],
              ),
            ),
            verticalSpace(22),
            isLoading ? const Center(
              child: CircularProgressIndicator(color: kPrimaryColor,),
            )
                :
            AppButton(
                text: "35".tr,
                onPress: (){
                  debugPrint(passwordController.text);
                  debugPrint(confirmPasswordController.text);
                  if(formKey.currentState!.validate()){
                    toGetNavigate(const LoginScreen());
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
