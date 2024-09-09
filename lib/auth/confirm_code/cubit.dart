import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/auth/confirm_code/states.dart';
import 'package:full_thimar_project/auth/login/view.dart';
import 'package:full_thimar_project/auth/password/view.dart';

import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';

class ConfirmCodeCubit extends Cubit<ConfirmCodeStates>
{
  ConfirmCodeCubit(): super(ConfirmCodeStates());

  bool isTimerFinished = false;
  final formKey = GlobalKey<FormState>();
  final codeController = TextEditingController();
  final phoneController = TextEditingController();
  bool isLoading = false;

  Future<void> resend({required String phone}) async{
    await DioHelper().sendData("resend_code", data:
        {
          "phone" :phone,
        }
    );
  }

  void verify({required bool isActive,required String phone}) async {

    final response = await DioHelper().sendData("verify", data: {
      "code": codeController.text,
      "type": Platform.operatingSystem,
      "device_token": "test",
      "phone":phone,
    });
    if (response.isSuccess) {
      showMessage(response.message, type: MessageType.success);
      if(isActive){
        toGetNavigate(const LoginScreen());
      } else {
        toGetNavigate(const PasswordScreen());
      }
    } else {
      showMessage(response.message);
    }
    isLoading = false;
  }
}