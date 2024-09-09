import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import '../../../../core/design/app_button.dart';
import '../../../core/utils/constant.dart';
import '../../../features/favs/cubit.dart';
import '../../../features/favs/states.dart';
import '../../../features/products/model.dart';
import '../main/widget/product_details_view.dart';

class FavouritePageView extends StatefulWidget {
  const FavouritePageView({super.key});

  @override
  State<FavouritePageView> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavouritePageView> {
  late FavoriteCubit cubit;
  @override
  void initState() {
    super.initState();
    cubit=BlocProvider.of(context);
    cubit.getFavorites();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("المفضلة",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
      ),
      body: BlocBuilder(
        bloc: cubit,
        builder: (context, state) {
          if (state is GetFavoriteSuccessState) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 163 / 250,
                mainAxisSpacing: 0,
                crossAxisSpacing: 16,
              ),
              itemCount: state.list.length,
              itemBuilder: (context, index) =>
                  _Item(model: state.list[index]),
            );
          } else if (state is GetFavoriteFailedState) {
            return const Center(child: Text("FAILED"));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({ required this.model});

  final ProductModel model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        toGetNavigate(ProductDetailsView(id: model.id,isFav: model.isFavorite,));
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(17),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.08),
                    offset: const Offset(0, 2),
                    blurRadius: 11,
                  )
                ]),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: 8,
                ),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(11),
                    child: Stack(
                      alignment: AlignmentDirectional.topEnd,
                      children: [
                        CachedNetworkImage(
                          imageUrl: model.mainImage,
                          width: 145,
                          height: 117,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          width: 54,
                          height: 19,
                          padding: const EdgeInsets.only(top: 3.0),
                          decoration: BoxDecoration(
                              color: Theme.of(context).primaryColor,
                              borderRadius: const BorderRadiusDirectional.only(
                                  bottomStart: Radius.circular(11))),
                          child: Center(
                            child: Text(
                              "${model.discount} %",
                              textDirection: TextDirection.ltr,
                              style: const TextStyle(
                                  color: Colors.white,
                                  fontFamily: "l",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsetsDirectional.only(start: 9.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        model.title,
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          "السعر / 1كجم",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                      Text.rich(TextSpan(
                          text: "${model.price} ر.س",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Theme.of(context).primaryColor,
                          ),
                          children: [
                            const TextSpan(text: "\t"),
                            TextSpan(
                              text: "${model.priceBeforeDiscount} ر.س",
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 16,
                                decoration: TextDecoration.lineThrough,
                                color: Theme.of(context).primaryColor,
                              ),
                            )
                          ])),
                      Padding(
                        padding: const EdgeInsetsDirectional.only(
                            start: 24.0, end: 24, top: 10, bottom: 10,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(9),
                            color: kPrimaryColor,
                          ),
                          width: 115,
                          height: 35,
                          child: AppButton(
                            text: "أضف للسلة",
                            onPress: () {},
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}