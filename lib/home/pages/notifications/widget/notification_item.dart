import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/notifications/model.dart';

class Item extends StatelessWidget {
  const Item({super.key, required this.model});
  final Notifications model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20,),
      child: DecoratedBox(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(11),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.035),
                blurRadius: 20,
              )
            ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsetsDirectional.only(end: 10),
                height: 33,
                width: 33,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: const Color(0xff4C8613).withAlpha(13),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6),
                  child: AppImage(
                    model.image ?? AssetsData.logo,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      model.title,
                      style: TextStyles.textStyle12Medium,
                    ),
                    Text(
                      model.body,
                      style: TextStyles.textStyle10Regular.copyWith(
                        color: const Color(0xff989898),
                      ),
                    ),
                    Text(
                      model.createdAt,
                      style: TextStyles.textStyle10Regular.copyWith(
                        color: const Color(0xff091022),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}