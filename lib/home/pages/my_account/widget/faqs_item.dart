import 'package:flutter/material.dart';
import 'package:full_thimar_project/features/faqs/model.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/text_styles.dart';

class FaqsItem extends StatelessWidget {
  final FaqsModel model;

  const FaqsItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 170,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${model.id} :",
                style: TextStyles.textStyle15Bold,
              ),
              horizontalSpace(5),
              Text(
                model.question,
                style: TextStyles.textStyle15Bold,
              ),
              const Spacer(),
              Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                  color: kPrimaryColor.withOpacity(.13),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: IconButton(
                  padding: const EdgeInsets.only(bottom: 1),
                  onPressed: () {
                    showModalBottomSheet(
                      elevation: 0.0,
                      context: context,
                      builder: (context) => Padding(
                        padding: const EdgeInsets.all(16),
                        child: SizedBox(
                          height: 100,
                          width: double.infinity,
                          child: Text(
                            model.answer,
                            style: TextStyles.textStyle15Light.copyWith(
                              color: const Color(0xff828282),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                  icon: const Icon(
                    Icons.arrow_downward_outlined,
                    size: 15,
                    color: kPrimaryColor,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
