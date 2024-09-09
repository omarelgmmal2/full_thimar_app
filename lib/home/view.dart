import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/home/pages/favs/view.dart';
import 'package:full_thimar_project/home/pages/main/view.dart';
import 'package:full_thimar_project/home/pages/my_account/view.dart';
import 'package:full_thimar_project/home/pages/my_orders/view.dart';
import 'package:full_thimar_project/home/pages/notifications/view.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int currentIndex = 0;

  List<Widget> pages = const [
    MainPageView(),
    MyOrdersPageView(),
    NotificationPageView(),
    FavouritePageView(),
    MyAccountPageView(),
  ];

  List<String> titles = [
    "38".tr,
    "39".tr,
    "40".tr,
    "41".tr,
    "42".tr,
  ];

  List<String> icons = [
    "home",
    "my_orders",
    "notification",
    "favs",
    "my_account"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          currentIndex = value;
          setState(() {});
        },
        backgroundColor: kPrimaryColor,
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color(0xffAED489),
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: List.generate(
          pages.length,
              (index) => BottomNavigationBarItem(
            icon: AppImage(
              "assets/icons/svg/${icons[index]}.svg",
              color: currentIndex == index
                  ? Colors.white
                  : const Color(0xffAED489),
            ),
            label: titles[index],
          ),
        ),
      ),
    );
  }
}
