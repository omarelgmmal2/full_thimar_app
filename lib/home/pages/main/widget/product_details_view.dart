import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import '../../../../core/design/custom_icon_filled_button.dart';
import '../../../../core/utils/text_styles.dart';
import '../../../../features/cart/cubit.dart';
import '../../../../features/cart/states.dart';
import '../../../../features/favs/cubit.dart';
import '../../../../features/product_details/cubit.dart';
import '../../../../features/product_details/states.dart';
import '../../../../features/products/cubit.dart';
import '../../../../features/products/model.dart';
import '../../../../features/products/states.dart';
import 'add_to_cart.dart';

class ProductDetailsView extends StatefulWidget {
  ProductDetailsView({super.key, required this.id, required this.isFav});

  final int id;
  late bool isFav;

  @override
  State<ProductDetailsView> createState() => _ProductDetailsViewState();
}

class _ProductDetailsViewState extends State<ProductDetailsView> {

  int amount = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProductDetailsCubit()..getData(widget.id),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ControlButtonItem(
              width: 32,
              height: 32,
              onTap: () {
                Navigator.pop(context);
              },
              icon: CupertinoIcons.back,
              iconColor: kPrimaryColor.withOpacity(.80),
              iconSize: 22,
              color: kPrimaryColor.withOpacity(.13),
            ),
          ),
          actions: [
            Builder(builder: (context) {
              FavoriteCubit favCubit = BlocProvider.of(context);
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: StatefulBuilder(
                  builder: (context, setState) {
                    return ControlButtonItem(
                      onTap: () {
                        widget.isFav?
                        favCubit.removeItem(id: widget.id)
                            :favCubit.addToFavorite(widget.id);
                        widget.isFav=!widget.isFav;
                        setState(() {});
                      },
                      width: 32,
                      height: 32,
                      icon: widget.isFav? Icons.favorite : Icons.favorite_border,
                      iconColor:
                      widget.isFav ? Colors.red : kPrimaryColor,
                      iconSize: 22,
                      color: widget.isFav ? Colors.red.withOpacity(.14)
                          : kPrimaryColor.withOpacity(.13),
                    );
                  },
                ),
              );
            },
            ),
          ],
        ),
        body: Builder(
            builder: (context) {
              ProductDetailsCubit cubit=BlocProvider.of(context);
              return BlocBuilder(
                bloc: cubit,
                builder: (context, state) {
                  if (state is ProductsFailedState) {
                    return const Center(
                      child: Text("FAILED"),
                    );
                  } else if (state is ProductGetSuccessState) {
                    return Column(
                      children: [
                        Expanded(
                          child: ListView(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsetsDirectional.only(start: 16, end: 17),
                            children: [
                              Container(
                                height: 322,
                                alignment: Alignment.topCenter,
                                child: ClipRRect(
                                  borderRadius: const BorderRadiusDirectional.only(
                                      bottomStart: Radius.circular(50),
                                      bottomEnd: Radius.circular(50),
                                      topEnd: Radius.circular(25),
                                      topStart: Radius.circular(25),
                                  ),
                                  child: AppImage(
                                    cubit.model.mainImage,
                                    height: 322,
                                    width: 375,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Row(
                                children: [
                                  Text(
                                    cubit.model.title,
                                    style: TextStyles.textStyle22Bold,
                                  ),
                                  const Spacer(),
                                  Text(
                                    textDirection: TextDirection.ltr,
                                    "${cubit.model.discount} %",
                                    style: TextStyles.textStyle14Bold.copyWith(
                                      color: Colors.red,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Text(
                                      cubit.model.price.toString(),
                                      style: TextStyles.textStyle20Bold,
                                    ),
                                  ),
                                  Text(
                                    cubit.model.priceBeforeDiscount.toString(),
                                    style: TextStyles.textStyle18Bold,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "السعر /1 كجم",
                                    style: TextStyles.textStyle19Light.copyWith(
                                      color: Colors.grey,
                                    ),
                                  ),
                                  const Spacer(),
                                  Container(
                                    height: 35,
                                    width: 109,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: kPrimaryColor.withOpacity(.13),
                                    ),
                                    child: StatefulBuilder(
                                      builder: (context, setState) =>
                                          Row(
                                            mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                            children: [
                                              ControlButtonItem(
                                                onTap: () {
                                                  cubit.amount++;
                                                  cubit.updatePrice();
                                                  setState(() {});
                                                },
                                                width: 29,
                                                height: 29,
                                                icon: Icons.add,
                                                iconColor: kPrimaryColor,
                                                iconSize: 20,
                                              ),
                                              Text(
                                                "${cubit.amount}",
                                                style: TextStyles.textStyle16Medium.copyWith(
                                                  color: kPrimaryColor,
                                                ),
                                              ),
                                              ControlButtonItem(
                                                  onTap: () {
                                                    if (cubit.amount > 1) {
                                                      cubit.amount--;
                                                      cubit.updatePrice();
                                                      // amount = cubit.amount;
                                                      setState(() {});
                                                    }
                                                  },
                                                  width: 29,
                                                  height: 29,
                                                  icon: Icons.remove,
                                                  iconColor: kPrimaryColor,
                                                  iconSize: 20,
                                              )
                                            ],
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                              const Divider(color: Colors.white),
                              verticalSpace(14),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text.rich(
                                  style: TextStyles.textStyle17Bold,
                                  TextSpan(
                                    text: "كود المنتج :   ",
                                    children: [
                                    TextSpan(
                                        text: cubit.model.id.toString(),
                                        style: TextStyles.textStyle17Bold
                                    ),
                                  ],
                                  ),
                                ),
                              ),
                              verticalSpace(14),
                              const Divider(color: Colors.white),
                              verticalSpace(14),
                              const Row(
                                children: [
                                  Text(
                                    "تفاصيل المنتج",
                                    style: TextStyles.textStyle17Bold,
                                  ),
                                ],
                              ),
                              verticalSpace(10),
                              Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Text(
                                  cubit.model.description,
                                  style: TextStyles.textStyle14Regular,
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 16.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "التقييمات",
                                      style: TextStyles.textStyle17Bold,
                                    ),
                                    TextButton(
                                      onPressed: () {},
                                      child: const Text(
                                        "عرض الكل",
                                        style: TextStyles.textStyle15Medium,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 87,
                                child: ListView.separated(
                                  itemBuilder: (context, index) => const _RateItem(),
                                  separatorBuilder: (context, index) => horizontalSpace(20),
                                  itemCount: 3,
                                  scrollDirection: Axis.horizontal,
                                ),
                              ),
                              const Align(
                                alignment: AlignmentDirectional.topStart,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(vertical: 16),
                                  child: Text(
                                    "منتجات مشابهة",
                                    style: TextStyles.textStyle17Bold,
                                  ),
                                ),
                              ),
                              BlocBuilder<ProductsCubit, ProductsStates>(
                                builder: (context, state) {
                                  if (state is ProductsSuccessState) {
                                    return SizedBox(
                                      height: 178,
                                      child: ListView.separated(
                                          padding: const EdgeInsetsDirectional.only(bottom: 5),
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) =>
                                          widget.id == state.list[index].id
                                              ? const SizedBox.shrink()
                                              : _SimilarityItem(
                                              model: state.list[index],
                                          ),
                                          separatorBuilder: (context, index) =>
                                          widget.id == state.list[index].id
                                              ? const SizedBox.shrink()
                                              : horizontalSpace(10),
                                          itemCount: state.list.length,
                                      ),
                                    );
                                  } else if (state is ProductGetFailedState) {
                                    return const SizedBox(
                                        height: 172,
                                        child: Center(child: Text("FAILED"),
                                        ),
                                    );
                                  } else {
                                    return const SizedBox(
                                        height: 172,
                                        child: Center(
                                            child: CircularProgressIndicator(),
                                        ),
                                    );
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: double.infinity,
                          color: kPrimaryColor,
                          padding: const EdgeInsetsDirectional.only(start: 27, end: 20),
                          child: Row(
                            children: [
                              Container(
                                width: 35,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: kPrimaryColor,
                                ),
                                child: const AppImage(
                                  AssetsData.shoppingCard,
                                  width: 17,
                                  height: 16,
                                  fit: BoxFit.scaleDown,
                                ),
                              ),
                              horizontalSpace(10),
                              Builder(builder: (context) {
                                CartCubit bloc = BlocProvider.of(context);
                                return BlocConsumer(
                                  bloc: bloc,
                                  listener: (context, addToCartState) {
                                    if (addToCartState is AddToCartSuccessState  ) {
                                      showModalBottomSheet(
                                        context: (navigatorKey.currentContext!),
                                        backgroundColor: Colors.transparent,
                                        builder: (context) =>
                                            AddToCartSheet(model: cubit.model,amount: cubit.amount),
                                      );
                                    }
                                  },
                                  builder: (context, addToCartState) {
                                    return TextButton(
                                      onPressed: () {
                                        bloc.addToCart(
                                          id: widget.id,
                                          amount: BlocProvider.of<ProductDetailsCubit>(context).amount,
                                        );
                                      },
                                      child: Text(
                                        "إضافة إلي السلة",
                                        style: TextStyles.textStyle15Bold.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
                                );
                              },
                              ),
                              const Spacer(),
                              Text(
                                "${cubit.totalPrice.toStringAsFixed(2)} ر.س",
                                style: TextStyles.textStyle15Bold.copyWith(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(child: CircularProgressIndicator());
                  }
                },
              );
            }
        ),
      ),
    );
  }


  @override
  void dispose() {
    super.dispose();
  }
}

class _RateItem extends StatelessWidget {
  const _RateItem();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 87,
      width: 267,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      "محمد علي",
                      style: TextStyles.textStyle16Bold,
                    ),
                    horizontalSpace(7),
                    ...List.generate(4, (index) => const Icon(
                      CupertinoIcons.star_fill,
                      color: Color(0xffFF9529),
                    ),
                    ),
                    const Icon(
                      CupertinoIcons.star,
                      color: Color(0xffD5D5D5),
                    ),
                  ],
                ),
                verticalSpace(9),
                Text(
                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة",
                  style: TextStyles.textStyle15Regular.copyWith(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 7),
            padding: const EdgeInsets.only(left: 5),
            clipBehavior: Clip.antiAlias,
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
            ),
            child: const AppImage(
              AssetsData.logo,
              fit: BoxFit.cover,
              height: 55,
              width: 55,
            ),
          ),
        ],
      ),
    );
  }
}

class _SimilarityItem extends StatelessWidget {
  const _SimilarityItem({required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        toGetNavigate(ProductDetailsView(id: model.id, isFav: model.isFavorite,));
      },
      child: Container(
        height: 172,
        width: 155,
        padding: const EdgeInsetsDirectional.only(start: 7, end: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.1),
                offset: const Offset(2, 11),
                blurRadius: 11,
            ),
          ],
          borderRadius: BorderRadius.circular(11),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(11),
                  child: AppImage(
                    model.mainImage,
                    width: 140,
                    height: 94,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 80),
                  width: 55,
                  height: 19,
                  decoration: const BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadiusDirectional.only(
                        topEnd: Radius.circular(11),
                        bottomStart: Radius.circular(11),
                      ),
                  ),
                  child: Center(
                      child: Text(
                        "-${model.discount} %",
                        textDirection: TextDirection.ltr,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                ),
              ],
            ),
            verticalSpace(8),
            Text(
              model.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.textStyle13Bold,
            ),
            Text(
              "السعر / 1كجم",
              style: TextStyles.textStyle10Regular.copyWith(color: Colors.grey),
            ),
            Row(
              children: [
                Text(
                  "${model.price} ر.س",
                  style: TextStyles.textStyle13Bold,
                ),
                Text(
                  "${model.priceBeforeDiscount} ر.س",
                  style: TextStyles.textStyle10Regular.copyWith(
                    decoration: TextDecoration.lineThrough,
                    color: kPrimaryColor,
                  ),
                ),
                const Spacer(),
                Container(
                    height: 24,
                    width: 24,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      color: kPrimaryColor,
                    ),
                    child: const Icon(
                      CupertinoIcons.add,
                      color: Colors.white,
                      size: 20,
                    ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}