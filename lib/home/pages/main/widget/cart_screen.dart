import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/core/utils/text_styles.dart';
import '../../../../core/design/app_button.dart';
import '../../../../core/logic/helper_methods.dart';
import '../../../../features/cart/cubit.dart';
import '../../../../features/cart/states.dart';
import 'complete_order.dart';
import 'item_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _ShopCartViewState();
}

class _ShopCartViewState extends State<CartScreen> {
  late CartCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of(context)..getCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            width: 200,
            height: 32,
            padding: const EdgeInsetsDirectional.only(start: 8),
            margin: const EdgeInsets.all(8),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: kPrimaryColor.withOpacity(0.13),
            ),
            child: const Center(
              child: Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        title: const Text("السلة"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: BlocBuilder(
          bloc: cubit,
          buildWhen: (previous, current) =>
              current is GetCartItemsSuccessState ||
              current is GetCartItemsLoadingState,
          builder: (context, state) {
            print(state);
            debugPrint("*" * 60);
            if (state is GetCartItemsSuccessState) {
              return Column(
                children: [
                  ListView.separated(
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) =>
                        Item(model: state.model.list[index]),
                    separatorBuilder: (context, index) => verticalSpace(10),
                    itemCount: state.model.list.length,
                  ),
                  verticalSpace(10),
                  if (state.model.list.isNotEmpty)
                    Expanded(
                      flex: 2,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            TextFormField(
                              onTapOutside: (val) {
                                FocusManager.instance.primaryFocus!.unfocus();
                              },
                              decoration: InputDecoration(
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                suffixIcon: Container(
                                  height: 40,
                                  width: 85,
                                  margin: const EdgeInsetsDirectional.all(8),
                                  child: AppButton(
                                    text: "تطبيق",
                                    onPress: () {},
                                  ),
                                ),
                                fillColor: kPrimaryColor.withOpacity(0.05),
                                hintText: "عندك كوبون ؟ ادخل رقم الكوبون",
                              ),
                            ),
                            verticalSpace(10),
                            const Text(
                              "جميع الأسعار تشمل قيمة الضريبة المضافة 15 %",
                              textDirection: TextDirection.rtl,
                              style: TextStyles.textStyle15Medium,
                            ),
                            verticalSpace(10),
                            Container(
                              height: 125,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 9),
                              decoration: BoxDecoration(
                                color: const Color(0xffF3F8EE),
                                borderRadius: BorderRadius.circular(13),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        "إجمالي المنتجات",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${state.model.totalPriceBeforeDiscount} ر.س ",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                    ],
                                  ),
                                  verticalSpace(10),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const Text(
                                        "الخصم",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${state.model.totalDiscount.toStringAsFixed(2)} ر.س",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                    ],
                                  ),
                                  const Divider(),
                                  Row(
                                    children: [
                                      const Text(
                                        "المجموع",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                      const Spacer(),
                                      Text(
                                        "${state.model.totalPriceWithVat} ر.س ",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            verticalSpace(11),
                            SizedBox(
                              height: 60,
                              width: double.infinity,
                              child: AppButton(
                                text: "الانتقال لإتمام الطلب",
                                onPress: () {
                                  toGetNavigate(const CompleteTheOrder());
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                ],
              );
            } else if (state is GetCartItemsFailedState) {
              return const Text("FAILED");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}