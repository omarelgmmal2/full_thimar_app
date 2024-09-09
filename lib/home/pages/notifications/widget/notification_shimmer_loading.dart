import 'package:flutter/material.dart';
import 'package:full_thimar_project/core/utils/constant.dart';
import 'package:shimmer/shimmer.dart';
import 'shimmer_widget.dart';

Widget notificationShimmerLoading() => Shimmer.fromColors(
  baseColor: kPrimaryColor.withOpacity(.5),
  highlightColor: kPrimaryColor.withOpacity(.5),
  child: DecoratedBox(
    decoration: BoxDecoration(
      color: kPrimaryColor.withOpacity(.3),
      borderRadius: BorderRadius.circular(11),
    ),
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShimmerWidget.rectangular(
            color: kPrimaryColor.withOpacity(.8),
            height: 30,
            width: 30,
            shapeBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(7),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ShimmerWidget.rectangular(
                  color: kPrimaryColor.withOpacity(.8),
                  height: 14,
                  width: 120,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                ShimmerWidget.rectangular(
                  color: kPrimaryColor.withOpacity(.8),
                  height: 11,
                  width: double.infinity,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                ShimmerWidget.rectangular(
                  color: kPrimaryColor.withOpacity(.8),
                  height: 10,
                  width: 100,
                  shapeBorder: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  ),
);