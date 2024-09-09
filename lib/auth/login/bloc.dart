import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/auth/login/events.dart';
import 'package:full_thimar_project/auth/login/states.dart';
import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import '../../home/view.dart';
import 'model.dart';


class LoginBloc extends Bloc<LoginEvents,LoginStates>{
  LoginBloc():super(LoginStates()){
    on<LoginEvent>(_login);
  }

  bool isSuccess = false;
  final formKey = GlobalKey<FormState>();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  void _login(LoginEvent event,Emitter<LoginStates> emit) async {

    if (formKey.currentState!.validate()) {
      emit(LoginLoadingStates());
      final response = await DioHelper().sendData(
        "login",
        data: {
          "phone": phoneController.text,
          "password": passwordController.text,
          "type": Platform.operatingSystem,
          "device_token": "test",
          "user_type": "client",
        },
      );
      print(response.response?.data);

      if (response.isSuccess) {
        final model = UserData.fromJson(response.response!.data);
        await CacheHelper.saveUserData(model.model);
        showMessage(response.message, type: MessageType.success);
        emit(LoginSuccessStates());
        toGetNavigate(const HomeView());
      } else {
        print(response.message);
        showMessage(response.message);
        emit(LoginFailedStates());
      }
    }
    }
}