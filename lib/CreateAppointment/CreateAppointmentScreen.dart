import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/ConfirmAppointment/ConfirmAppointmentScreen.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/CreateAppointment/views/CAChooseService.dart';
import 'package:sloti_co/CreateAppointment/views/CASelectService.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class CreateAppointmentScreen extends StatelessWidget {
  CreateAppointmentScreen({super.key});

  CAController caCtrl = Get.put(CAController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: appText.primaryText(
            text: 'Create  Appointment',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        backgroundColor: Color(0xffFAFAFA),
        body: GetBuilder<CAController>(builder: (_) {
          return SafeArea(
              child: Column(children: [
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
                          SpacerH(30.h),
                          CAChooseService(),
                          SpacerH(17.h),
                          Caselectservice(),
                          SpacerH(13.h),
                          // Cachoosespecialist(),
                          // SpacerH(100.h)
                        ],
                      ),
                    ),
                  ),
                ),
                if (_.selectedSSI.isNotEmpty)
                  Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      right: 20.w,
                      child: FadeInUp(
                        child: appButton.PrimaryButton(
                            onClick: () {
                              _.selectedDate = null;
                              _.selectedRoom = null;
                              _.fetchRoomList();
                              Get.to(() => ConfirmAppointmentScreen(),
                                  transition: Transition.rightToLeft);
                            },
                            name: "CONTINUE ( ₹${_.calculatePrice()} )"),
                      ))
              ],
            ))
          ]));
        }));
  }
}
