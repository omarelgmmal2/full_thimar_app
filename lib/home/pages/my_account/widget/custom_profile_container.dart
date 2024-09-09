import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/text_styles.dart';

class CustomProfileContainer extends StatelessWidget {
  const CustomProfileContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 220,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(50),
          bottomLeft: Radius.circular(50),
        ),
      ),
      child: Column(
        children: [
          verticalSpace(50),
          Text(
            "51".tr,
            style: TextStyles.textStyle20Bold.copyWith(color: Colors.white),
          ),
          verticalSpace(15),
          SizedBox(
            height: 120,
            width: 95,
            child: Column(
              children: [
                const AppImage(
                  AssetsData.profile,
                  height: 71,
                  width: 76,
                  fit: BoxFit.scaleDown,
                ),
                verticalSpace(2),
                Text(
                  "عمر الجمال",
                  style: TextStyles.textStyle14Bold.copyWith(color: Colors.white),
                ),
                verticalSpace(4),
                Text(
                  "01062156826",
                  style: TextStyles.textStyle14Regular.copyWith(color: const Color(0xffA2D273)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
