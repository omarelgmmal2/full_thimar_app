import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/features/privacy_policy/cubit.dart';
import 'package:full_thimar_project/features/privacy_policy/states.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/text_styles.dart';

class PrivacyPolicy extends StatelessWidget {
  const PrivacyPolicy({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PolicyCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "56".tr,
          ),
          leading: Container(
            height: 32,
            width: 32,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: kPrimaryColor.withOpacity(.13),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back_ios_new, color: kPrimaryColor),
            ),
          ),
        ),
        body: BlocBuilder<PolicyCubit,PolicyStates>(
          builder: (context, state) {
            if(state is GetPolicyLoadingStates){
              return const Center(child: CircularProgressIndicator(),);
            }else if(state is GetPolicySuccessStates){
              return ListView(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 33),
                children: [
                  Text(
                    state.list.data.policy,
                    style: TextStyles.textStyle15Light.copyWith(
                      color: const Color(0xff828282),
                    ),
                  ),
                ],
              );
          }else if(state is GetPolicyFailedStates){
              return Text(state.msg);
            }else{
              return const Text("Failed");
            }
          },
        ),
      ),
    );
  }
}
