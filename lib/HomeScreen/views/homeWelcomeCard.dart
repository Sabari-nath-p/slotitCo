import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/HomeScreen/controller/HomeController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class HomeWelcomeCard extends StatelessWidget {
  HomeWelcomeCard({super.key});
  HomeController hmCtrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 181.h,
      width: 386.w,
      decoration: BoxDecoration(
          color: const Color(0xFFEBEDF1),
          borderRadius: BorderRadius.circular(14)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          appText.primaryText(
              text: 'Good Morning',
              fontWeight: FontWeight.w500,
              fontSize: 22.sp,
              color: const Color(0xFF232627)),
          SpacerH(4.h),
          appText.primaryText(
              text: 'Hi, Dianne Ameter',
              fontWeight: FontWeight.w400,
              fontSize: 12.sp,
              color: const Color(0xFF757D7F)),
          SpacerH(30.h),
          appText.primaryText(
              text: 'Powered by Slot it',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF232627)),
          SpacerH(8.h),
          Container(
            alignment: Alignment.center,
            height: 46.h,
            width: 358.w,
            decoration: BoxDecoration(
                color: const Color(0xFF505864),
                borderRadius: BorderRadius.circular(23)),
            child: appText.primaryText(
                text: '${hmCtrl.bookingList.length} BOOKING TODAY',
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: const Color(0xFFFFFFFF)),
          )
        ],
      ),
    );
  }
}
