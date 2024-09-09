import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/logic/dio_helper.dart';
import 'event.dart';
import 'model.dart';
import 'states.dart';

class NotificationsBloc extends Bloc<NotificationsEvents, NotificationsStates> {
  NotificationsBloc() : super(NotificationsInitial()) {
    on<GetNotificationsEvent>(_getNotifications);
  }
  bool isLoading = true;
  List<dynamic> list = [];

  Future<void> _getNotifications(
      GetNotificationsEvent event, Emitter<NotificationsStates> emit) async {
    emit(GetNotificationsLoading());
    final response = await DioHelper().getData('notifications');

    if (response.isSuccess) {
      emit(GetNotificationsSuccess());
      final model = NotificationsData.fromJson(response.response!.data);
      list = model.data.notifications;
      if (list.isEmpty) {
        emit(GetNotificationsEmpty());
      }
      isLoading = false;
    } else {
      (GetNotificationsFailed());
      isLoading = false;
    }
  }
}