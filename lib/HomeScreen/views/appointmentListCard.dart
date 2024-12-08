import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sloti_co/AppointmentView/AppointmentViewScreen.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';

class Appointmentlistcard extends StatelessWidget {
  const Appointmentlistcard({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => AppointmentViewScreen(),
            transition: Transition.rightToLeft);
      },
      child: Container(
        width: 386.w,
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.only(bottom: 8.h),
        height: 170.h,
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appText.primaryText(
                text: 'Appointment Date',
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: const Color(0xFF757D7F)),
            SpacerH(6.h),
            Row(
              children: [
                Image.asset(
                  'asset/images/clock.png',
                  height: 14.h,
                  width: 14.w,
                ),
                SpacerW(8.w),
                appText.primaryText(
                    text: 'Mon, July 21 - 09:00 - 10:45 AM',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xFF757D7F)),
              ],
            ),
            SpacerH(13.5.h),
            Image.asset(
              'asset/images/line.png',
              width: 358.w,
            ),
            SpacerH(27.5.h),
            appText.primaryText(
                text: 'Sabarinath P',
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: const Color(0xFF232627)),
            Row(
              children: [
                appText.primaryText(
                    text: 'Hair Cut , Colouring , Facial',
                    fontWeight: FontWeight.w400,
                    fontSize: 12.sp,
                    color: const Color(0xFF757D7F)),
                SpacerW(110.w),
                appText.primaryText(
                    text: '\$58.00',
                    fontWeight: FontWeight.w700,
                    fontSize: 20.sp,
                    color: const Color(0xFF505864))
              ],
            ),
          ],
        ),
      ),
    );
  }
}
