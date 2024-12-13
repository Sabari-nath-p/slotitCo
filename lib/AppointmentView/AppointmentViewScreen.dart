import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/AppointmentView/views/AppointmentDetailsCard.dart';
import 'package:sloti_co/AppointmentView/views/PaymentMenuCard.dart';
import 'package:sloti_co/HomeScreen/views/appointmentListCard.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';

import '../src/utils.dart';

class AppointmentViewScreen extends StatelessWidget {
  const AppointmentViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: SafeArea(
            child: Column(children: [
          CAppBar(
            ScreenName: "Appointment View",
          ),
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
                        AppontmentDetailsCard(),
                        SpacerH(25.h),
                        appText.primaryText(
                            text: "Payment Mode",
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w500),
                        SpacerH(14.h),
                        PaymentMenuCard()

                        // code here
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20.h,
                  left: 20.w,
                  right: 20.w,
                  child: appButton.PrimaryButton(name: "MARK AS COMPLETED"))
            ],
          ))
        ])));
  }
}
