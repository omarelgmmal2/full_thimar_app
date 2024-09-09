import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:full_thimar_project/core/utils/assets.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:full_thimar_project/core/utils/spacing.dart';
import 'package:get/get.dart';
import 'package:kiwi/kiwi.dart';
import '../../../core/design/app_image.dart';
import '../../../features/notifications/bloc.dart';
import '../../../features/notifications/event.dart';
import '../../../features/notifications/states.dart';
import '../main/widget/item_cart.dart';
import 'widget/notification_shimmer_loading.dart';

class NotificationPageView extends StatefulWidget {
  const NotificationPageView({super.key});

  @override
  State<NotificationPageView> createState() => _NotificationPageViewState();
}

class _NotificationPageViewState extends State<NotificationPageView> {
  final bloc = KiwiContainer().resolve<NotificationsBloc>()
    ..add(GetNotificationsEvent());

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  Future<void> refreshCallback() async {
    bloc.add(GetNotificationsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("40".tr)),
      body: BlocBuilder(
        bloc: bloc,
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: state is GetNotificationsLoading || bloc.isLoading
                ? ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 18,
                    ),
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.only(top: 22, bottom: 15),
                    itemBuilder: (context, index) =>
                        notificationShimmerLoading(),
                    itemCount: 15,
                  )
                : state is GetNotificationsEmpty
                    ? Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const AppImage(
                              AssetsData.notFound,
                              width: 270,
                              // height: 180,
                            ),
                            const Text(
                              "home.data_not_found",
                              style: TextStyle(
                                fontSize: 25,
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            verticalSpace(40),
                          ],
                        ),
                      )
                    : RefreshIndicator(
                        displacement: 20,
                        strokeWidth: 3,
                        backgroundColor: Colors.green[100],
                        onRefresh: refreshCallback,
                        child: ListView.builder(
                          // physics: ,
                          padding: const EdgeInsets.only(top: 22, bottom: 15),
                          itemBuilder: (context, index) => Item(
                            model: bloc.list[index],
                          ),
                          itemCount: bloc.list.length,
                        ),
                      ),
          );
        },
      ),
    );
  }
}
