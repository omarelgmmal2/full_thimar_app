import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/core/utils/text_styles.dart';
import 'package:full_thimar_project/home/pages/main/widget/cart_screen.dart';
import '../../../../core/design/app_button.dart';
import '../../../../features/cart/cubit.dart';
import '../../../../features/products/model.dart';

class AddToCartSheet extends StatelessWidget {
  final ProductModel model;
  final int amount;

  const AddToCartSheet({super.key, required this.model, required this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: MediaQuery.of(context).size.height / 3.0,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
          ),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
              "تم إضافة المنتج بنجاح",
              style: TextStyles.textStyle14Bold,
            ),
          ),
          const Divider(color: Colors.white),
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: AppImage(
                    model.mainImage,
                    height: 78,
                    width: 98,
                    fit: BoxFit.cover,
                  ),
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
                            "${model.amount}",
                            style: TextStyles.textStyle15Light.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            "${model.price*amount}  ر.س",
                            style: TextStyles.textStyle15Bold,
                          ),
                        ],
                      ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Colors.white),
          verticalSpace(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              children: [
                Expanded(
                    child:
                    AppButton(
                      text: "التحويل إلى السلة",
                      onPress: () {
                      BlocProvider.of<CartCubit>(context).getCartItems();
                      toGetNavigate(const CartScreen());
                    },
                    ),
                ),
               verticalSpace(17),
                Expanded(
                    child: SizedBox(
                      height: 60,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                            child: Text(
                              "تصفح العروض",
                              style: TextStyles.textStyle14Regular.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}