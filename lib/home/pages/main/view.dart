import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/design/app_input.dart';
import 'package:full_thimar_project/core/logic/helper_methods.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:full_thimar_project/features/categories/states.dart';
import 'package:full_thimar_project/features/products/states.dart';
import 'package:full_thimar_project/features/slider/states.dart';
import 'package:full_thimar_project/home/pages/main/widget/custom_app_bar.dart';
import 'package:full_thimar_project/home/pages/main/widget/item_products.dart';
import 'package:get/get.dart';
import '../../../core/utils/text_styles.dart';
import '../../../features/categories/cubit.dart';
import '../../../features/products/cubit.dart';
import '../../../features/slider/cubit.dart';
import 'widget/product_details_view.dart';
import 'widget/item_categories.dart';

class MainPageView extends StatefulWidget {
  const MainPageView({super.key});

  @override
  State<MainPageView> createState() => _MainPageViewState();
}

class _MainPageViewState extends State<MainPageView> {

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SliderCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => CategoriesCubit()..getData(),
        ),
        BlocProvider(
          create: (context) => ProductsCubit()..getData(),
        ),
      ],
      child: Scaffold(
        appBar: const CustomAppBar(),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
              child: AppInput(labelText: "43".tr, icon: AssetsData.searchIconSvg),
            ),
            BlocBuilder<SliderCubit, SliderStates>(
              builder: (context, state) {
                if(state is GetSliderLoadingStates){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is GetSliderSuccessStates){
                  return Column(
                    children: [
                      CarouselSlider(
                        items: List.generate(
                          state.list.length,
                              (index) => AppImage(
                            state.list[index].media,
                            fit: BoxFit.fill,
                            height: 164,
                            width: double.infinity,
                          ),
                        ),
                        options: CarouselOptions(
                          height: 164,
                          autoPlay: true,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            currentIndex = index;
                            setState(() {});
                          },
                        ),
                      ),
                      verticalSpace(16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          state.list.length,
                              (index) => Padding(
                            padding: const EdgeInsetsDirectional.only(end: 3),
                            child: CircleAvatar(
                              radius: index == currentIndex ? 6 : 4,
                              backgroundColor: index == currentIndex
                                  ? kPrimaryColor
                                  : const Color(0xff61B80C),
                            ),
                          ),
                        ),
                      ),
                    ],
                  );
              }else if(state is GetSliderFailedStates){
                  return Text(state.msg);
                }else{
                  return const Text("Failed");
                }
              },
            ),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "47".tr,
                    style: TextStyles.textStyle15ExtraBold,
                  ),
                  TextButton(
                      child: Text(
                        "48".tr,
                        style: TextStyles.textStyle15Light,
                      ),
                    onPressed: (){},
                  ),
                ],
              ),
            ),
            verticalSpace(18),
            BlocBuilder<CategoriesCubit, CategoriesStates>(
              builder: (context, state) {
                if(state is CategoryLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is CategorySuccessState){
                  return SizedBox(
                    height: 103,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) => ItemCategories(model: state.list[index]),
                      separatorBuilder: (context, index) => horizontalSpace(16),
                      itemCount: state.list.length,
                    ),
                  );
              }else if(state is CategoryFailedState){
                  return Text(state.msg);
                }else {
                  return const Text("Failed");
                }
              },
            ),
            verticalSpace(30),
            BlocBuilder<ProductsCubit, ProductsStates>(
              builder: (context, state) {
                if(state is ProductsLoadingState){
                  return const Center(child: CircularProgressIndicator(),);
                }else if(state is ProductsSuccessState){
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "49".tr,
                          style: TextStyles.textStyle15Black,
                        ),
                        verticalSpace(7),
                        GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 163 / 250,
                            mainAxisSpacing: 26,
                            crossAxisSpacing: 26,
                          ),
                          itemCount: state.list.length,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              toGetNavigate(
                                ProductDetailsView(
                                  id: state.list[index].id,
                                  isFav: state.list[index].isFavorite,
                                ),
                              );
                            },
                              child: ItemProducts(model: state.list[index],),
                          ),
                        ),
                      ],
                    ),
                  );
              }else if(state is ProductsFailedState){
                  return Text(state.msg);
                }else{
                  return const Text("Failed");
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
