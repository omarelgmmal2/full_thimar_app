import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pw_validator/flutter_pw_validator.dart';
import 'package:full_thimar_project/auth/login/bloc.dart';
import 'package:full_thimar_project/auth/login/events.dart';
import 'package:full_thimar_project/auth/login/states.dart';
import 'package:full_thimar_project/core/design/app_button.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/design/app_input.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/core/utils/text_styles.dart';
import 'package:get/get.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/assets.dart';
import '../password/view.dart';
import '../register/view.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  late LoginBloc bloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    bloc.phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: bloc.phoneController.text.length,
      ),
    );
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Builder(
        builder: (context) {
          bloc = BlocProvider.of(context);
          return Scaffold(
            body: SafeArea(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                children: [
                  const AppImage(
                    AssetsData.logo,
                    height: 126,
                    width: 130,
                  ),
                  verticalSpace(20),
                  Text(
                    "4".tr,
                    style: TextStyles.textStyle16Bold,
                  ),
                  verticalSpace(5),
                  Text(
                    "5".tr,
                    style: TextStyles.textStyle16Light,
                  ),
                  Form(
                    key: bloc.formKey,
                    child: Column(
                      children: [
                        AppInput(
                          labelText: "7".tr,
                          icon: AssetsData.phoneIcon,
                          type: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              bloc.phoneController.text = value;
                            });
                          },
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                !AppRegex.isPhoneNumberValid(value)) {
                              return "6".tr;
                            }
                            return null;
                          },
                          controller: bloc.phoneController,
                          paddingTop: 28,
                          isPhone: true,
                        ),
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
                          controller: bloc.passwordController,
                          isPassword: true,
                          paddingBottom: 19,
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      toGetNavigate(const PasswordScreen());
                    },
                    child: Text(
                      textAlign: TextAlign.left,
                      "10".tr,
                      style: TextStyles.textStyle16Light,
                    ),
                  ),
                  verticalSpace(16),
                  FlutterPwValidator(
                    defaultColor: greyColor,
                    successColor: kPrimaryColor,
                    failureColor: Colors.red,
                    lowercaseCharCount: 2,
                    uppercaseCharCount: 1,
                    numericCharCount: 1,
                    normalCharCount: 3,
                    specialCharCount: 1,
                    width: 350,
                    height: 200,
                    minLength: 9,
                    onSuccess: () {
                      setState(() {
                        bloc.isSuccess = true;
                      });
                    },
                    onFail: () {
                      bloc.isSuccess = false;
                    },
                    controller: bloc.passwordController,
                  ),
                  verticalSpace(22),
                  BlocBuilder(
                    bloc: bloc,
                    builder: (context, state) {
                      if (state is LoginLoadingStates) {
                        return const Center(
                          child: CircularProgressIndicator(),);
                      } else {
                        return AppButton(
                          text: "11".tr,
                          onPress: () {
                            bloc.add(LoginEvent());
                          },
                        );
                      }
                    },
                  ),
                  verticalSpace(45),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "12".tr,
                        style: TextStyles.textStyle15Bold,
                      ),
                      GestureDetector(
                        onTap: () {
                          toGetNavigate(const RegisterScreen());
                        },
                        child: Text(
                          "13".tr,
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
      ),
    );
  }
}
