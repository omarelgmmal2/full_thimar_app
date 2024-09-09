import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';
import 'states.dart';


class GetProfileCubit extends Cubit<GetProfileStates> {
  GetProfileCubit() : super(GetProfileStates());

  late ProfileData model;

  void getData() async {
    emit(GetProfileLoadingStates());
    try {
      final response = await Dio().get("https://thimar.amr.aait-d.com/api/client/profile");
      model = ProfileData.fromJson(response.data);
      emit(GetProfileSuccessStates(list: model));
    } on DioException catch(ex) {
      emit(GetProfileFailedStates(msg: ex.response!.data["message"]));
    }
  }
}