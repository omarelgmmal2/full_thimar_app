class NotificationStates{}

class NotificationLoadingState extends NotificationStates{}

class NotificationSuccessState extends NotificationStates{}

class NotificationFailedState extends NotificationStates{
  final String msg;
  NotificationFailedState ({required this.msg});
}



abstract class NotificationsStates {}

final class NotificationsInitial extends NotificationsStates {}

final class GetNotificationsLoading extends NotificationsStates {}

final class GetNotificationsSuccess extends NotificationsStates {}

final class GetNotificationsFailed extends NotificationsStates {}
final class GetNotificationsEmpty extends NotificationsStates {}