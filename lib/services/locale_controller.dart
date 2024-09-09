import 'dart:ui';
import 'package:get/get.dart';
import '../core/logic/cache_helper.dart';

class MyLocaleController extends GetxController{
  Locale initialLang = CacheHelper.prefs.getString("lang") == null ? Get.deviceLocale! : Locale(CacheHelper.prefs.getString("lang")!);

  void changeLang(String codeLang){
    Locale locale = Locale(codeLang);
    CacheHelper.prefs.setString("lang", codeLang);
    Get.updateLocale(locale);
  }
}