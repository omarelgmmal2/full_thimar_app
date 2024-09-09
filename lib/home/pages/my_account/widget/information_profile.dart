import 'package:flutter/material.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/text_styles.dart';

class InformationProfile extends StatelessWidget {
  final String text;
  final String icon;
  const InformationProfile({super.key, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 22),
      child: Row(
        children: [
          AppImage(
            icon,
            width: 14,
            height: 18,
          ),
          horizontalSpace(10),
          Text(
            text,
            style: TextStyles.textStyle13Bold,
          ),
          const Spacer(),
          Container(
            height: 20,
            width: 20,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              border: Border.all(
                color: const Color(0xffB2BCA8),
                width: 1.5,
              ),
            ),
            child: const Icon(Icons.arrow_forward,size: 15,color: Color(0xffB2BCA8),),
          ),
        ],
      ),
    );
  }
}
