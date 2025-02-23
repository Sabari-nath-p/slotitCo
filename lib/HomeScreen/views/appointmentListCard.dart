import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/AppointmentView/AppointmentViewScreen.dart';
import 'package:sloti_co/ConfirmAppointment/View/timeCardView.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/HomeScreen/controller/HomeController.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';
import 'package:sloti_co/src/appText.dart';

class Appointmentlistcard extends StatelessWidget {
  BookingModel model;
  Appointmentlistcard({super.key, required this.model});
  HomeController hmCtrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => AppointmentViewScreen(
                  model: model,
                ),
            transition: Transition.rightToLeft);
      },
      child: Container(
        width: 386.w,
        padding: EdgeInsets.all(14),
        margin: EdgeInsets.only(
          bottom: 8.h,
        ),
        height: 150.h,
        decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
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
                              text:
                                  '${DateFormat("EEE, MMM d").format(DateTime.parse(model.date!))} - ${model.timeFrom} - ${model.timeTo}',
                              fontWeight: FontWeight.w400,
                              fontSize: 12.sp,
                              color: const Color(0xFF757D7F)),
                        ],
                      ),
                    ],
                  ),
                ),
                if (model.status == "completed")
                  Container(
                    width: 80.w,
                    alignment: Alignment.center,
                    height: 21.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.r),
                        color: Colors.green),
                    child: appText.primaryText(
                        text: "Completed",
                        color: Colors.white,
                        fontSize: 10.sp),
                  )
              ],
            ),
            SpacerH(13.5.h),
            Image.asset(
              'asset/images/line.png',
              width: 358.w,
            ),
            SpacerH(18.5.h),
            appText.primaryText(
                text: model.userDetail!.firstName,
                fontWeight: FontWeight.w500,
                fontSize: 14.sp,
                color: const Color(0xFF232627)),
            Row(
              children: [
                Expanded(
                  child: appText.primaryText(
                      text: model.shopServices == null
                          ? ""
                          : model.shopServices!
                              .map((value) => value.name)
                              .toList()
                              .join(", "),
                      fontWeight: FontWeight.w400,
                      align: TextAlign.start,
                      fontSize: 12.sp,
                      color: const Color(0xFF757D7F)),
                ),
                SpacerW(20.w),
                appText.primaryText(
                    text: '₹${hmCtrl.calculateCost(model.shopServices ?? [])}',
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
