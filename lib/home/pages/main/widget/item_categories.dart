import 'package:flutter/material.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/categories/model.dart';

class ItemCategories extends StatelessWidget {
  final CategoriesModel model;
  const ItemCategories({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 73,
          width: 73,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: AppImage(model.media),
        ),
        Text(
          model.name,
          style: TextStyles.textStyle20Medium,
        ),
      ],
    );
  }
}
