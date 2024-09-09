import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/utils/constant.dart';

class MyOrdersPageView extends StatelessWidget {
  const MyOrdersPageView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            "طلباتي",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          bottom: TabBar(
              padding: const EdgeInsets.symmetric(horizontal: 16,),
              automaticIndicatorColorAdjustment: true,
              unselectedLabelColor: kPrimaryColor,
              unselectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
              indicator: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kPrimaryColor,
              ),
              tabs: const [
                Tab(
                  child: Text(
                    "الحاليه",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Tab(
                  child: Text(
                    "المنتهية",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsetsDirectional.only(top: 20, start: 16, end: 17),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => const _Item(),
                      itemCount: 4,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding:
              const EdgeInsetsDirectional.only(top: 20, start: 16, end: 17),
              child: Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, index) => const _Item(),
                      itemCount: 4,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Item extends StatelessWidget {
  const _Item();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsetsDirectional.only(bottom: 16),
      decoration:
      BoxDecoration(borderRadius: BorderRadius.circular(15), boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(.02),
          offset: const Offset(0, 6),
          blurRadius: 17,
          blurStyle: BlurStyle.outer,
        )
      ]),
      height: 100,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4.0, bottom: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "طلب #4587",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 17),
                ),
                const Text(
                  "27,يونيو,2021",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-photo/fresh-red-tomatoes_2829-13449.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.1.699160303.1690903232&semt=sph"),
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-vector/isolated-orange-carrot-cartoon_1308-127216.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.2.699160303.1690903232&semt=sph"),
                    const _ItemYouBuy(
                        img:
                        "https://img.freepik.com/free-photo/slice-watermelon-white-background_93675-128140.jpg?size=626&ext=jpg&uid=R100743807&ga=GA1.2.699160303.1690903232&semt=sph"),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: const Color(0xffEDF5E6),
                          borderRadius: BorderRadius.circular(7)),
                      child: const Center(
                          child: Text(
                            "+2",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          )),
                    ),
                    // ItemYouBuy(img: "img"),
                  ],
                ),
              ],
            ),
          ),
          const Spacer(),
          Padding(
            padding:
            const EdgeInsetsDirectional.only(top: 4.0, bottom: 4, end: 9),
            child: Column(
              children: [
                SizedBox(
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(0xffEDF5E6)),
                    child: const Text(
                      "بإنتظار الموافقة",
                      style: TextStyle(
                          color: kPrimaryColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const Spacer(),
                const Text(
                  "180 ر.س",
                  style: TextStyle(
                      color: kPrimaryColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemYouBuy extends StatelessWidget {
  const _ItemYouBuy({required this.img});

  final String img;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Container(
        height: 25,
        width: 25,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            border: Border.all(color: Colors.grey.withOpacity(.6))),
        child: Center(
            child: Image.network(
              img,
              height: 20,
              width: 20,
              fit: BoxFit.scaleDown,
            )),
      ),
    );
  }
}