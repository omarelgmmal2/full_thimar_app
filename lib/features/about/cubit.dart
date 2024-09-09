import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import 'model.dart';
import 'states.dart';

class AboutCubit extends Cubit<AboutStates> {
  AboutCubit() : super(AboutStates());

  late AboutData data;

  Future<void> getData() async {
    emit(GetAboutLoadingStates());
    final response = await DioHelper().getData("about");
    if (response.isSuccess) {
      data = AboutData.fromJson(response.response!.data);
      emit(GetAboutSuccessStates(list: data));
    } else {
      emit(GetAboutFailedStates(msg: response.message));
    }
  }
}
