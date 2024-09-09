import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/design/app_image.dart';
import '../../../../core/utils/assets.dart';
import '../../../../core/utils/constant.dart';
import '../../../../core/utils/spacing.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/cart/cubit.dart';
import '../../../../features/cart/model.dart';

class Item extends StatelessWidget {
  final CartModel model;
  const Item({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: double.infinity,
      padding: const EdgeInsetsDirectional.only(top: 8, bottom: 8, start: 6, end: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.03),
            offset: const Offset(0, 6),
            spreadRadius: 5,
            blurRadius: 17,
          ),
        ],
      ),
      child: Row(
        children: [
          AppImage(
            model.image,
            height: 78,
            width: 98,
            fit: BoxFit.cover,
          ),
          horizontalSpace(9),
          Expanded(
            child: SizedBox(
              height: 78,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title,
                    style: TextStyles.textStyle15Bold,
                  ),
                  Text(
                    "${model.price}  ر.س",
                    style: TextStyles.textStyle15Bold,
                  ),
                  StatefulBuilder(
                    builder: (context, setState) => Container(
                      height: 30,
                      width: 80,
                      padding: const EdgeInsetsDirectional.all(2),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: const Color(0xffebf2e5),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.only(bottom: 2),
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.plus,
                                size: 18,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                          Center(
                            child: Text(
                              "${model.amount}",
                              style: TextStyles.textStyle15Regular,
                            ),
                          ),
                          Container(
                            height: 23,
                            width: 23,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: Colors.white,
                            ),
                            child: IconButton(
                              padding: const EdgeInsets.only(bottom: 2),
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.minus,
                                size: 18,
                                color: kPrimaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              BlocProvider.of<CartCubit>(context).deleteFromCart(id: model.id);
            },
            child: Container(
              width: 27,
              height: 27,
              decoration: BoxDecoration(
                color: const Color(0xffffe3e3),
                borderRadius: BorderRadius.circular(7),
              ),
              child: const AppImage(
                AssetsData.trash,
                width: 14,
                height: 14,
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
