import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/features/get_cities/states.dart';
import '../../core/logic/dio_helper.dart';
import 'model.dart';


class GetCitiesCubit extends Cubit<GetCitiesStates> {
  GetCitiesCubit() : super(GetCitiesStates());

  void getData() async {
    emit(GetCitiesLoadingStates());
    final response = await DioHelper().getData("cities/1");
    if (response.isSuccess) {
      final model = GetCitiesData.fromJson(response.response!.data);
      emit(GetCitiesSuccessStates(list: model.list));
    } else {
      emit(GetCitiesFailedStates());
    }
  }
}
