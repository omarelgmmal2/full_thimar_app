import 'dart:async';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import '../auth/login/view.dart';
import '../core/logic/cache_helper.dart';
import '../core/logic/helper_methods.dart';
import '../home/view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 5), () {
      toGetNavigate(CacheHelper.isAuth()? const HomeView():const LoginScreen());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AppImage(
            AssetsData.splashBackgroundImage,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
            color: kPrimaryColor.withOpacity(.1),
          ),
          Center(
            child: FadeInDownBig(
              child: const AppImage(
                AssetsData.logo,
                height: 160,
                width: 160,
              ),
            ),
          ),
          const Positioned(
            bottom: -100,
            right: -130,
            child: AppImage(
              AssetsData.assortmentVegetables,
              width: 410,
              height: 404,
            ),
          ),
        ],
      ),
    );
  }
}
