import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/text_styles.dart';
import 'package:full_thimar_project/splash/view.dart';
import 'package:get/get.dart';
import '../core/logic/helper_methods.dart';
import '../core/theme_services/theme_services.dart';
import 'locale_controller.dart';

class ChooseLanguage extends StatelessWidget {
  const ChooseLanguage({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controllerLang = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.topLeft,
          child: Text(
            "1".tr,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: kPrimaryColor,
        leading: IconButton(
          onPressed: () {
            ThemeServices().changeTheme();
          },
          icon: const Icon(CupertinoIcons.moon_stars),
          color: Colors.black,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "37".tr,
              style: TextStyles.textStyle16SemiBold,
            ),
            MaterialButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {
                controllerLang.changeLang("ar");
                toGetNavigate(
                  const SplashView(),
                );
              },
              child: Text(
                "2".tr,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            MaterialButton(
              color: kPrimaryColor,
              textColor: Colors.white,
              onPressed: () {
                controllerLang.changeLang("en");
                toGetNavigate(
                  const SplashView(),
                );
              },
              child: Text(
                "3".tr,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
