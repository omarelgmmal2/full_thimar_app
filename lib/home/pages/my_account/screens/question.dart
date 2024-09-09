import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/features/faqs/cubit.dart';
import 'package:full_thimar_project/features/faqs/states.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constant.dart';
import '../widget/faqs_item.dart';

class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FaqsCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "55".tr,
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
        body: BlocBuilder<FaqsCubit, FaqsStates>(
          builder: (context, state) {
            if (state is GetFaqsLoadingStates) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetFaqsSuccessStates) {
              return ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 17, vertical: 33),
                itemBuilder: (context, index) => FaqsItem(
                  model: state.list[index],
                ),
                itemCount: state.list.length,
              );
            } else if (state is GetFaqsFailedStates) {
              return Text(state.msg);
            } else {
              return const Text("Failed");
            }
          },
        ),
      ),
    );
  }
}
