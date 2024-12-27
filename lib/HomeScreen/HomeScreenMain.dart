import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/HomeScreen/views/appointmentListCard.dart';
import 'package:sloti_co/HomeScreen/views/homeMenuCard.dart';
import 'package:sloti_co/HomeScreen/views/homeWelcomeCard.dart';
import 'package:sloti_co/Schedule/ScheduleScreen.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
          child: Column(
        children: [
          CAppBar(
            ScreenName: 'HomeScreen',
          ),
          SpacerH(30.h),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeWelcomeCard(),
                  SpacerH(20.h),
                  HomeMenuCard(),
                  SpacerH(10.h),
                  Container(
                    alignment: Alignment.center,
                    height: 46.h,
                    width: 358,
                    decoration: BoxDecoration(
                        color: const Color(0xFF505864),
                        borderRadius: BorderRadius.circular(23)),
                    child: appText.primaryText(
                        text: 'ADD BOOKING',
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                        color: const Color(0xFFFFFFFF)),
                  ),
                  SpacerH(14.h),
                  Container(
                    height: 54.h,
                    width: 386.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            appText.primaryText(
                                text: 'Upcoming Appointment ',
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: const Color(0xFF232627)),

                            InkWell(
                              onTap: (){
                                Get.to(()=>ScheduleScreen());
                              },
                              child: appText.primaryText(
                                text: 'See All',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: const Color(0xFF232627)),
                            )
                          ],
                        ),

                        SpacerH(5.h),
                        Row(
                          children: [
                            Image.asset(
                              'asset/images/clock.png',
                              height: 14.h,
                              width: 14.w,
                            ),
                            SpacerW(8.w),
                            appText.primaryText(
                                text: 'Mon, July 21 - 09:00',
                                fontWeight: FontWeight.w400,
                                fontSize: 12.sp,
                                color: const Color(0xFF757D7F)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SpacerH(16.h),
                  for (int i = 0; i <= 10; i++) Appointmentlistcard()
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
