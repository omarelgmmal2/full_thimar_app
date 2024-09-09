import 'package:full_thimar_project/features/privacy_policy/model.dart';


class PolicyStates{}

class GetPolicyLoadingStates extends PolicyStates{}

class GetPolicySuccessStates extends PolicyStates{
  final PolicyData list;
  GetPolicySuccessStates({required this.list});
}

class GetPolicyFailedStates extends PolicyStates{
  final String msg;
  GetPolicyFailedStates({required this.msg});
}