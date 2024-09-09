import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:full_thimar_project/core/design/app_image.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import '../../../../core/design/app_button.dart';
import '../../../../core/design/custom_icon_filled_button.dart';
import '../../../../core/utils/text_styles.dart';

class CompleteTheOrder extends StatelessWidget {
  const CompleteTheOrder({super.key});

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
        title: const Text("إتمام الطلب"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "الاسم : محمد ",
                style: TextStyles.textStyle17Bold,
              ),
              verticalSpace(11),
              const Text(
                "الجوال  : 05068285914 ",
                style: TextStyles.textStyle17Bold,
              ),
              verticalSpace(36),
              Row(
                children: [
                  const _Item(title: "اختر عنوان التوصيل"),
                  const Spacer(),
                  ControlButtonItem(
                    width: 26,
                    height: 26,
                    icon: Icons.add,
                    iconColor: kPrimaryColor,
                    iconSize: 20,
                    color: kPrimaryColor.withOpacity(.13),
                  )
                ],
              ),
              verticalSpace(18),
              Container(
                height: 35,
                padding: const EdgeInsets.symmetric(horizontal: 13),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(17),
                    border: Border.all(
                        color: kPrimaryColor,
                        width: 1.5,
                    ),
                ),
                child: Row(
                  children: [
                    const Text(
                      "المنزل : 119 طريق الملك عبدالعزيز",
                      style: TextStyles.textStyle15Medium,
                    ),
                    const Spacer(),
                    DropdownButton(
                      items: const [],
                      iconSize: 30,
                      icon: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: Theme.of(context).primaryColor,
                      ),
                      onChanged: (value) {},
                    )
                  ],
                ),
              ),
              verticalSpace(32),
              const _Item(title: "تحديد وقت التوصيل "),
              horizontalSpace(13),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.grey.withOpacity(.3), width: 1.5,
                            ),
                            borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "اختر اليوم و التاريخ",
                              style: TextStyles.textStyle15Medium,
                            ),
                            horizontalSpace(10),
                            SvgPicture.asset(
                              AssetsData.calendar,
                              width: 25,
                            ),
                          ],
                        ),
                    ),
                  ),
                  horizontalSpace(16),
                  Expanded(
                      child: Container(
                          height: 60,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.grey.withOpacity(.3),
                                  width: 1.5,
                              ),
                              borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "اختر الوقت",
                                style: TextStyles.textStyle15Medium,
                              ),
                              horizontalSpace(20),
                              const AppImage(
                                AssetsData.time,
                                width: 25,
                              ),
                            ],
                          ),
                      ),
                  ),
                ],
              ),
              verticalSpace(22),
              const _Item(title: "ملاحظات وتعليمات"),
              verticalSpace(7),
              TextFormField(
                maxLines: 8,
                minLines: 6,
              ),
              verticalSpace(20),
              const _Item(title: "اختر طريقة الدفع"),
              verticalSpace(10),
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    const _PayItem(text: "كاش", imgPath: "assets/icons/svg/cash.svg"),
                    horizontalSpace(16),
                    const _PayItem( imgPath: "assets/icons/svg/visa.svg"),
                    horizontalSpace(16),
                    const _PayItem( imgPath: "assets/icons/svg/mastercard.svg"),
                  ],
                ),
              ),
              verticalSpace(16),
              const _Item(title: "ملخص الطلب"),
              verticalSpace(16),
              Container(
                height: 150,
                padding: const EdgeInsets.all(9),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(13),
                    color: const Color(0xffF3F8EE),
                ),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DetailsItem(name: "إجمالي المنتجات", price: "180"),
                    _DetailsItem(name: "سعر التوصيل", price: "40"),
                    _DetailsItem(name: "الخصم", price: "-40"),
                    Divider(),
                    _DetailsItem(name: "المجموع", price: "180"),
                  ],
                ),
              ),
              verticalSpace(30),
              SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: AppButton(
                      text: "إنهاء الطلب",
                      onPress: () {},
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.textStyle17Bold,
    );
  }
}

class _DetailsItem extends StatelessWidget {
  const _DetailsItem({required this.name, required this.price});

  final String name, price;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          name,
          style: TextStyles.textStyle15Medium,
        ),
        const Spacer(),
        Text(
          "$price ر.س",
          style: TextStyles.textStyle15Medium,
        ),
      ],
    );
  }
}

class _PayItem extends StatelessWidget {
  const _PayItem({this.text, required this.imgPath});

  final String? text;
  final String imgPath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 50,
        width: 104,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(11),
            border: Border.all(
                color: kPrimaryColor,
                width: 2
            ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AppImage(
              imgPath,
              width: 30,
              height: 24,
            ),
            horizontalSpace(7),
            Text(
              text??"",
              style: TextStyles.textStyle18Bold,
            ),
          ],
        ),
      ),
    );
  }
}