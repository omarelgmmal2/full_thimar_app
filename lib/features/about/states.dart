import 'package:full_thimar_project/features/about/model.dart';


class AboutStates{}

class GetAboutLoadingStates extends AboutStates{}
class GetAboutSuccessStates extends AboutStates{
  final AboutData list;
  GetAboutSuccessStates({required this.list});
}
class GetAboutFailedStates extends AboutStates{
  final String msg;
  GetAboutFailedStates({required this.msg});
}