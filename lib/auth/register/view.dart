import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/auth/login/view.dart';
import 'package:full_thimar_project/auth/register/cubit.dart';
import 'package:full_thimar_project/auth/register/states.dart';
import 'package:get/get.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/design/app_input.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/regex/app_regex.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_styles.dart';
import 'cities_sheet.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  late RegisterCubit cubit = RegisterCubit();

  @override
  Widget build(BuildContext context) {
    cubit.phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: cubit.phoneController.text.length,
      ),
    );
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Builder(
        builder: (context) {
          cubit = BlocProvider.of(context);
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
                    "14".tr,
                    style: TextStyles.textStyle16Light,
                  ),
                  Form(
                    key: cubit.formKey,
                    child: Column(
                      children: [
                        AppInput(
                          labelText: "16".tr,
                          icon: AssetsData.userIcon,
                          paddingTop: 28,
                          controller: cubit.fullNameController,
                          type: TextInputType.name,
                          validator: (value) {
                            if (value!.isEmpty || !AppRegex.hasLowerCase(value)) {
                              return "15".tr;
                            }
                            return null;
                          },
                        ),
                        AppInput(
                          labelText: "7".tr,
                          icon: AssetsData.phoneIcon,
                          type: TextInputType.phone,
                          onChanged: (value) {
                            setState(() {
                              cubit.phoneController.text = value;
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
                          controller: cubit.phoneController,
                          isPhone: true,
                        ),
                        StatefulBuilder(
                          builder: (context, setState) => GestureDetector(
                            onTap: () async {
                              var result = await showModalBottomSheet(
                                context: context,
                                builder: (context) => const CitiesSheet(),
                              );
                              if (result != null) {
                                cubit.selectedCity = result;
                                setState(() {});
                              }
                            },
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: AbsorbPointer(
                                    absorbing: true,
                                    child: AppInput(
                                      labelText:
                                      cubit.selectedCity?.name ?? "18".tr,
                                      validator: (value) {
                                        if (cubit.selectedCity == null) {
                                          return "31".tr;
                                        }
                                        return null;
                                      },
                                      icon: "assets/icons/city.png",
                                    ),
                                  ),
                                ),
                                if (cubit.selectedCity != null)
                                  IconButton(
                                    onPressed: () {
                                      cubit.selectedCity = null;
                                      setState(() {});
                                    },
                                    icon: const Icon(
                                      Icons.clear,
                                      size: 24,
                                      color: Colors.red,
                                    ),
                                  ),
                              ],
                            ),
                          ),
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
                          controller: cubit.passwordController,
                          isPassword: true,
                          paddingBottom: 19,
                        ),
                        AppInput(
                          labelText: "19".tr,
                          icon: AssetsData.passwordIcon,
                          type: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value == null ||
                                value != cubit.passwordController.text ||
                                value.isEmpty ||
                                !AppRegex.isPasswordValid(value)) {
                              return "20".tr;
                            }
                            return null;
                          },
                          controller: cubit.confirmPasswordController,
                          isPassword: true,
                          paddingBottom: 19,
                        ),
                      ],
                    ),
                  ),
                  verticalSpace(22),
                  BlocBuilder(
                    bloc: cubit,
                    builder: (context, state) {
                      if (state is RegisterLoadingStates) {
                        return const Center(
                            child: CircularProgressIndicator());
                      } else {
                        return AppButton(
                          text: "21".tr,
                          onPress: () {
                            cubit.register();
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
      ),
    );
  }
}
