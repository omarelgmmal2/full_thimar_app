import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import 'model.dart';
import 'states.dart';

class FaqsCubit extends Cubit<FaqsStates> {
  FaqsCubit() : super(FaqsStates());

  Future<void> getData() async {
    emit(GetFaqsLoadingStates());
    final response = await DioHelper().getData("faqs");
    if (response.isSuccess) {
      final model = FaqsData.fromJson(response.response!.data);
      emit(GetFaqsSuccessStates(list: model.list));
    } else {
      emit(GetFaqsFailedStates(msg: response.message));
    }
  }
}
