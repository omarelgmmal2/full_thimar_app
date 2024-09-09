import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/auth/confirm_code/cubit.dart';
import 'package:full_thimar_project/auth/confirm_code/states.dart';
import 'package:full_thimar_project/auth/login/view.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../core/design/app_button.dart';
import '../../core/design/app_image.dart';
import '../../core/logic/helper_methods.dart';
import '../../core/utils/assets.dart';
import '../../core/utils/constant.dart';
import '../../core/utils/spacing.dart';
import '../../core/utils/text_styles.dart';

class ConfirmCodeScreen extends StatefulWidget {
  final bool isActive;
  final String phone;

  const ConfirmCodeScreen(
      {super.key, required this.isActive, required this.phone,});

  @override
  State<ConfirmCodeScreen> createState() => _ConfirmCodeScreenState();
}

class _ConfirmCodeScreenState extends State<ConfirmCodeScreen> {


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ConfirmCodeCubit(),
      child: Builder(
        builder: (context) {
          ConfirmCodeCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: SafeArea(
              child: Form(
                key: cubit.formKey,
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
                      widget.isActive ? "24".tr : "33".tr,
                      style: TextStyles.textStyle16Bold,
                    ),
                    verticalSpace(5),
                    Text(
                      "25".tr,
                      style: TextStyles.textStyle16Light,
                    ),
                    Row(
                      children: [
                        Text(
                            "+${widget.phone}",
                            textDirection: TextDirection.ltr,
                            style: TextStyles.textStyle16Light
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                              "تغيير رقم الجوال",
                              style: TextStyles.textStyle16Regular
                          ),
                        ),
                      ],
                    ),
                    verticalSpace(20),
                    PinCodeTextField(
                      controller: cubit.codeController,
                      appContext: context,
                      length: 4,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(15),
                        fieldHeight: 60,
                        fieldWidth: 70,
                        inactiveColor: const Color(0xffF3F3F3),
                        selectedColor: kPrimaryColor,
                      ),
                      keyboardType: TextInputType.number,
                    ),
                    verticalSpace(22),
                    BlocBuilder<ConfirmCodeCubit, ConfirmCodeStates>(
                      builder: (context, state) {
                        if (state is ConfirmCodeLoadingState) {
                          return const Center(
                              child: CircularProgressIndicator());
                        } else{
                          return AppButton(
                              text: "28".tr,
                              onPress: () {
                            cubit.verify(
                              isActive: widget.isActive ,
                              phone: widget.phone,
                            );
                          });
                        }
                      },
                    ),
                    verticalSpace(27),
                    Text(
                      "30".tr,
                      textAlign: TextAlign.center,
                      style: TextStyles.textStyle16Light,
                    ),
                    verticalSpace(25),
                    cubit.isTimerFinished
                        ? const SizedBox.shrink()
                        : CircularCountDownTimer(
                      duration: 10,
                      initialDuration: 0,
                      width: 66,
                      height: 70,
                      ringColor: kPrimaryColor,
                      fillColor: const Color(0xffD8D8D8),
                      strokeWidth: 3,
                      onComplete: () {
                        cubit.isTimerFinished = true;
                        setState(() {});
                      },
                      textStyle: TextStyles.textStyle20Bold,
                      textFormat: CountdownTextFormat.MM_SS,
                      isReverseAnimation: true,
                    ),
                    verticalSpace(19),
                    cubit.isTimerFinished
                        ? Center(
                      child: OutlinedButton(
                        onPressed: () {
                          cubit.isTimerFinished = false;
                          setState(() {});
                        },
                        child: const Text(
                          "إعادة الإرسال",
                          style: TextStyles.textStyle15Bold,
                        ),
                      ),
                    )
                        : const SizedBox.shrink(),
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
            ),
          );
        }
      ),
    );
  }
}
