import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import 'model.dart';
import 'states.dart';

class PolicyCubit extends Cubit<PolicyStates> {
  PolicyCubit() : super(PolicyStates());

  late PolicyData data;

  Future<void> getData() async {
    emit(GetPolicyLoadingStates());
    final response = await DioHelper().getData("policy");
    if (response.isSuccess) {
      data = PolicyData.fromJson(response.response!.data);
      emit(GetPolicySuccessStates(list: data));
    } else {
      emit(GetPolicyFailedStates(msg: response.message));
    }
  }
}
