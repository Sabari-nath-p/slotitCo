import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/AppointmentView/Service/AppointmentController.dart';
import 'package:sloti_co/AppointmentView/views/AppointmentDetailsCard.dart';
import 'package:sloti_co/AppointmentView/views/PaymentMenuCard.dart';
import 'package:sloti_co/AppointmentView/views/markasCompleteDialog.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/ServiceList/Models/ServiceModel.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';

import '../src/utils.dart';

class AppointmentViewScreen extends StatelessWidget {
  BookingModel model;
  AppointmentViewScreen({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    AptController aptController = Get.put(AptController());
    return Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: Text(
            'Appointment',
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
          actions: [],
        ),
        body: SafeArea(
            child: Column(children: [
          SpacerH(30.h),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        appText.primaryText(
                            text: "Services",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SpacerH(14.h),
                        AppontmentDetailsCard(
                          model: model,
                        ),
                        SpacerH(25.h),
                        // appText.primaryText(
                        //     text: "Payment Mode",
                        //     fontSize: 16.sp,
                        //     fontWeight: FontWeight.w500),
                        // SpacerH(14.h),
                        if (false) PaymentMenuCard()

                        // code here
                      ],
                    ),
                  ),
                ),
              ),
              if (model.status != "completed")
                Positioned(
                    bottom: 20.h,
                    left: 20.w,
                    right: 20.w,
                    child: appButton.PrimaryButton(
                      onClick: () {
                        Get.dialog(
                            MarkasComplete(
                              model: model,
                            ),
                            barrierDismissible: false);
                      },
                      name: "MARK AS COMPLETED",
                    ))
            ],
          ))
        ])));
  }
}
