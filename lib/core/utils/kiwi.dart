import 'package:kiwi/kiwi.dart';
import '../../features/notifications/bloc.dart';

void initKiwi(){
  KiwiContainer container = KiwiContainer();

  container.registerFactory((container) => NotificationsBloc());

}