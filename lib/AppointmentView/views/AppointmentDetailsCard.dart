import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/AppointmentView/Service/AppointmentController.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class AppontmentDetailsCard extends StatelessWidget {
  BookingModel model;
  AppontmentDetailsCard({super.key, required this.model});
  AptController aptController = Get.put(AptController());
  @override
  Widget build(BuildContext context) {
    return Container(
      //  height: 285.h,
      width: 386.w,
      padding: EdgeInsets.all(14.w),
      //  margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
              text: model.userDetail!.firstName,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(5.h),
          Row(
            children: [
              Image.asset(
                'asset/images/loaction.png',
                height: 13.69.h,
                width: 10.7.w,
              ),
              SpacerW(8.08.w),
              appText.primaryText(
                  text: 'Booking ID : #12342113 ',
                  fontWeight: FontWeight.w400,
                  fontSize: 12.sp,
                  color: const Color(0xFF95918D)),
            ],
          ),
          SpacerH(20.h),
          Row(
            children: [
              appText.primaryText(
                  text: '${model.timeFrom} - ${model.timeTo}',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xFF3D3A38)),
              SpacerW(7.w),
              Image.asset(
                'asset/images/Oval.png',
                height: 8.h,
                width: 8.h,
              ),
              SpacerW(7.w),
              appText.primaryText(
                  text:
                      "${DateFormat("EEE, MMM d").format(DateTime.parse(model.date!))}",
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xFF3D3A38)),
            ],
          ),
          SpacerH(7.h),
          appText.primaryText(
              text: model.shopRoom!.name,
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(13.h),
          for (ShopServiceModel data in model.shopServices ?? [])
            Container(
              margin: EdgeInsets.only(
                bottom: 5.h,
              ),
              child: Row(
                children: [
                  Image.asset(
                    'asset/images/Oval.png',
                    height: 8.h,
                    width: 8.h,
                  ),
                  SpacerW(4.w),
                  appText.primaryText(
                      text: data.name,
                      fontWeight: FontWeight.w500,
                      fontSize: 12.sp,
                      color: const Color(0xFF95918D)),
                ],
              ),
            ),
          SpacerH(17.h),
          Container(
            padding: EdgeInsets.all(14.w),
            height: 52.h,
            width: 358.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFFF7F6F5)),
            child: Row(
              children: [
                appText.primaryText(
                    text: 'TOTAL PAY',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: const Color(0xFF95918D)),
                Spacer(),
                appText.primaryText(
                    text:
                        '₹${aptController.calculatePrice(model: model.shopServices ?? [])}',
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: const Color(0xFF505864)),
              ],
            ),
          )
        ],
      ),
    );
  }
}
