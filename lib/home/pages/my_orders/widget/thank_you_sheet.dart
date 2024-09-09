import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_button.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import '../../../../core/design/app_image.dart';
import '../../../view.dart';

class ThankYouSheet extends StatelessWidget {
  const ThankYouSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const SizedBox(
              height: 14,
            ),
            const AppImage(
              AssetsData.thankYou,
              height: 215,
              width: 240,
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              'complete_order.thank_you',
              style: TextStyle(
                  color: kPrimaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            const Text(
                'complete_order.you_can_follow',
              style: TextStyle(
                  color: Color(0xffACACAC),
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 26,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: AppButton(
                      text: 'home_nav.my_orders',
                      onPress: () {
                        toGetNavigate(
                            const HomeView(
                              //isNavigatToOrder: true,
                            ),
                            );
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 16,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 55,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                          Navigator.pop(context);
                          // navigateTo(toPage:  HomeView(), isRemove: true);
                        },
                        child: const Text(
                          'home_nav.main_page',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 22,
            ),
          ],
        ),
      ),
    );
  }
}