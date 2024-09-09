import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/home/pages/main/widget/cart_screen.dart';
import 'package:get/get.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/text_styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 16),
        height: 60,
        child: Row(
          children: [
            const AppImage(
              AssetsData.logo,
              height: 21,
              width: 21,
              fit: BoxFit.scaleDown,
            ),
            horizontalSpace(3),
            Text(
              "44".tr,
              style: TextStyles.textStyle14Bold,
            ),
            Expanded(
              child: Text.rich(
                textAlign: TextAlign.center,
                TextSpan(
                  text: "45".tr,
                  style: TextStyles.textStyle12Medium,
                  children: [
                    TextSpan(
                      text: "46".tr,
                      style: TextStyles.textStyle14Regular,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                toGetNavigate(const CartScreen());
              },
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(9),
                  color: kPrimaryColor.withOpacity(.13),
                ),
                child: const Badge(
                  alignment: AlignmentDirectional.topStart,
                  padding: EdgeInsetsDirectional.symmetric(horizontal: 4, vertical: 1),
                  backgroundColor: kPrimaryColor,
                  label: Text(
                    "3",
                    style: TextStyles.textStyle10Bold,
                  ),
                  child: Center(
                    child: AppImage(
                      AssetsData.cartIconSvg,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
