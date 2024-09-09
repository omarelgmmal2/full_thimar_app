import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/features/products/model.dart';
import '../../../../core/design/app_button.dart';
import '../../../../core/utils/text_styles.dart';

class ItemProducts extends StatelessWidget {
  final ProductModel model;

  const ItemProducts({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                clipBehavior: Clip.antiAlias,
                borderRadius: BorderRadius.circular(11),
                child: AppImage(
                  model.mainImage,
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: AlignmentDirectional.topEnd,
                child: Container(
                  decoration: const BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadiusDirectional.only(
                      bottomStart: Radius.circular(11),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 1),
                    child: Text(
                      "${model.discount}%",
                      style: TextStyles.textStyle14Bold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          model.title,
          style: TextStyles.textStyle16Bold,
        ),
        Text(
          "السعر / 1${model.unit.name}",
          style: TextStyles.textStyle12Light,
        ),
        Text.rich(
          TextSpan(
            text: "${model.price} ر.س",
            style: TextStyles.textStyle16Bold,
            children: [
              TextSpan(
                text: " ${model.priceBeforeDiscount} ر.س",
                style: TextStyles.textStyle16Bold.copyWith(
                  decoration: TextDecoration.lineThrough,
                ),
              ),
            ],
          ),
        ),
        verticalSpace(19),
        SizedBox(
          height: 30,
          width: 115,
          child: AppButton(
            text: "أضف للسلة",
            onPress: () {},
          ),
        ),
      ],
    );
  }
}
