import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/cache_helper.dart';
import '../../core/logic/dio_helper.dart';
import '../../core/logic/helper_methods.dart';
import 'states.dart';

class LogoutCubit extends Cubit<LogoutStates> {
  LogoutCubit() : super(LogoutStates());

  Future<void> logout() async {
    final response = await DioHelper().sendData(
      "logout",
        data: {
      "device_token": "test",
          "type": Platform.operatingSystem,
        },
    );
    if (response.isSuccess) {
      await CacheHelper.clear();
      showMessage(response.message);
      emit(LogoutSuccessState());
    } else {
      emit(LogoutFailedState());
      showMessage(response.message);
    }
  }
}