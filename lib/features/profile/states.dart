import 'model.dart';

class GetProfileStates{}
class GetProfileLoadingStates extends GetProfileStates{}
class GetProfileSuccessStates extends GetProfileStates{
  final ProfileData list;
  GetProfileSuccessStates({required this.list});
}
class GetProfileFailedStates extends GetProfileStates{
  final String msg;

  GetProfileFailedStates({required this.msg});
}