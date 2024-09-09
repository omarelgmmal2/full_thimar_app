import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/features/log_out/cubit.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'core/logic/cache_helper.dart';
import 'core/theme_services/theme_services.dart';
import 'core/utils/kiwi.dart';
import 'features/cart/cubit.dart';
import 'features/categories/cubit.dart';
import 'features/favs/cubit.dart';
import 'features/get_cities/cubit.dart';
import 'features/product_details/cubit.dart';
import 'features/products/cubit.dart';
import 'features/slider/cubit.dart';
import 'services/locale.dart';
import 'services/locale_controller.dart';
import 'services/page_choose_language.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await GetStorage.init();
  initKiwi();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: kPrimaryColor,
    ),
  );
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    MyLocaleController controller = Get.put(MyLocaleController());
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CartCubit(),
        ),
        BlocProvider(
          create: (context) => FavoriteCubit(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => ProductDetailsCubit(),
        ),
        BlocProvider(
          create: (context) => SliderCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => GetCitiesCubit(),
        ),
        BlocProvider(
          create: (context) => LogoutCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: "Thimar App",
        theme: ThemeServices().lightTheme,
        darkTheme: ThemeServices().darkTheme,
        themeMode: ThemeServices().getThemeMode(),
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        locale: controller.initialLang,
        translations: MyLocale(),
        home: const ChooseLanguage(),
      ),
    );
  }
}