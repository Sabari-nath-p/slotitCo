import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/HomeScreen/controller/HomeController.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/Schedule/controller/BookingController.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/endpoint.dart';

class MarkasComplete extends StatefulWidget {
  BookingModel model;
  MarkasComplete({super.key, required this.model});

  @override
  State<MarkasComplete> createState() => _MarkasCompleteState();
}

class _MarkasCompleteState extends State<MarkasComplete> {
  bool isloading = false;

  changeStatus() async {
    setState(() {
      isloading = true;
    });
    try {
      final Response = await patch(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "/${widget.model.id}/update-status"),
          headers: authHead,
          body: json.encode({"status": "completed"}));
      print(Response.body);
      print(Response.statusCode);
      if (Response.statusCode == 200) {
        Get.back();
        Get.back();
        HomeController hmCtrl = Get.put(HomeController());
        hmCtrl.fetchTodayBooking();
        BKController bkCtrl = Get.put(BKController());
        bkCtrl.fetchBooking(
            filter: DateFormat("yyyy-MM-dd").format(bkCtrl.selectedDate));
      }
    } catch (e) {
      print(e);
    }
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: Container(
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (isloading)
              Column(
                children: [
                  SizedBox(
                      height: 100.h,
                      width: 100.w,
                      child: LoadingAnimationWidget.newtonCradle(
                          color: appColor.primaryColor, size: 24.r)),
                  SizedBox(height: 16.h),
                  Text(
                    'Mark Service Completed',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              )
            else
              Column(
                children: [
                  Icon(
                    Icons.warning_rounded,
                    color: Colors.red,
                    size: 48.sp,
                  ),
                  SizedBox(height: 16.h),
                  Text(
                    'Mark Service Completed',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    'Are you sure you want to mark this service as completed? This action cannot be undone.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 24.h),
                  Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () => Get.back(),
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8.r),
                              side: BorderSide(color: Colors.grey[300]!),
                            ),
                          ),
                          child: appText.primaryText(
                            text: 'Cancel',
                            fontSize: 16.sp,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      SizedBox(width: 12.w),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            changeStatus();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(vertical: 12.h),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.greenAccent),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                          ),
                          child: appText.primaryText(
                            text: 'Complete',
                            color: Colors.green,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
