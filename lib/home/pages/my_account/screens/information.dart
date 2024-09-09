import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/features/about/states.dart';
import 'package:get/get.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/about/cubit.dart';

class Information extends StatelessWidget {
  const Information({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AboutCubit()..getData(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "54".tr,
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
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 33),
          children: [
            const AppImage(
              AssetsData.logo,
              width: 160,
              height: 158,
            ),
            verticalSpace(25.5),
            BlocBuilder<AboutCubit,AboutStates>(
                builder: (context, state) {
                  if(state is GetAboutLoadingStates){
                    return const Center(child: CircularProgressIndicator(),);
                    }else if(state is GetAboutSuccessStates){
                    return Text(
                      state.list.data.about,
                      style: TextStyles.textStyle15Light.
                      copyWith(color: const Color(0xff828282),
                      ),
                    );
                  }else if(state is GetAboutFailedStates){
                    return Text(
                      state.msg,
                    );
                  }else{
                    return const Text("Failed");
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
