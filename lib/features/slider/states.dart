import '../../../../features/slider/model.dart';

class SliderStates{}

class GetSliderLoadingStates extends SliderStates{}
class GetSliderSuccessStates extends SliderStates{
  final List<SliderModel> list;
  GetSliderSuccessStates({required this.list});
}
class GetSliderFailedStates extends SliderStates{
  final String msg;
  GetSliderFailedStates({required this.msg});
}