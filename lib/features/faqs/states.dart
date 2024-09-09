import 'package:full_thimar_project/features/faqs/model.dart';

class FaqsStates{}

class GetFaqsLoadingStates extends FaqsStates{}

class GetFaqsSuccessStates extends FaqsStates{
  final List<FaqsModel> list;
  GetFaqsSuccessStates({required this.list});
}

class GetFaqsFailedStates extends FaqsStates{
  final String msg;
  GetFaqsFailedStates({required this.msg});
}