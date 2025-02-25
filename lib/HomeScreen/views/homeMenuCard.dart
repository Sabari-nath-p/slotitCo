import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sloti_co/RoomScreen/RoomScreen.dart';
import 'package:sloti_co/ServiceList/ServiceListView.dart';
import 'package:sloti_co/ShopAnalytics/shopAnalyticsScreen.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 165.h,
      width: 386.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
              text: 'Menu',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF232627)),
          SpacerH(17.h),
          Row(
            children: [
              _menucard('Manage', 'asset/images/serviceIcon.png', () {
                Get.to(() => ServiceListView(),
                    transition: Transition.rightToLeft);
              }),
              SpacerW(15.w),
              _menucard('Analytics', 'asset/images/analytics.png', () {
                Get.to(() => AnalyticsPage(),
                    transition: Transition.rightToLeft);
              }),
              SpacerW(14.w),
              _menucard('Shop Room', 'asset/images/staffs.png', () {
                Get.to(() => RoomScreen(), transition: Transition.rightToLeft);
              }),
            ],
          ),
        ],
      ),
    );
  }
}

_menucard(String text, image, Function onclick) {
  return InkWell(
    onTap: () {
      onclick();
    },
    child: Container(
      height: 106.h,
      width: 119.w,
      decoration: BoxDecoration(
          color: const Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              alignment: Alignment.center,
              height: 50.h,
              width: 50.w,
              decoration: BoxDecoration(
                  color: const Color(0xFFEBEDF1),
                  borderRadius: BorderRadius.circular(10)),
              child: Image.asset(
                image,
                // scale: 1.4,
                height: 40.h,
                width: 40.w,
              )),
          SpacerH(14.h),
          appText.primaryText(
              text: text,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0xFF232627))
        ],
      ),
    ),
  );
}
