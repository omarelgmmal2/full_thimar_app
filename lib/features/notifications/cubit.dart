import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/logic/dio_helper.dart';
import 'package:full_thimar_project/features/notifications/model.dart';
import 'package:full_thimar_project/features/notifications/states.dart';

class NotificationsCubit extends Cubit<NotificationStates>{
  NotificationsCubit() :super(NotificationStates());

  bool isLoading = true;
  List<dynamic> list = [];

  Future<void> getData()async{
    emit(NotificationLoadingState());
    final response = await DioHelper().getData("notifications");
    if(response.isSuccess){
      final model = NotificationsData.fromJson(response.response!.data);
      emit(NotificationSuccessState());
      list = model.data.notifications;
      if (list.isEmpty) {
      }
      isLoading = false;
    }else{
      emit(NotificationFailedState(msg: response.message));
      isLoading = false;
    }
  }
}