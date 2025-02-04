import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/ConfirmAppointment/View/ContactCard.dart';
import 'package:sloti_co/ConfirmAppointment/View/calenderViewCard.dart';
import 'package:sloti_co/ConfirmAppointment/View/timeCardView.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/CreateAppointment/views/CAChooseSpecialist.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ConfirmAppointmentScreen extends StatelessWidget {
  const ConfirmAppointmentScreen({super.key});

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
        return Stack(
          children: [
            Positioned(
              top: 0,
              right: 0,
              left: 0,
              bottom: 0,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Cachoosespecialist(),
                    if (_.selectedRoom != null)
                      FadeInUp(child: WeekCalendarView(
                        onDateSelected: (p0) {
                          _.selectedDate = p0;
                          _.fetchTimeSlot();
                          _.update();
                        },
                      )),
                    if (_.selectedRoom != null)
                      FadeInUp(
                        child: TimeSlotSelector(
                          slots: _.timeSlot,
                          onSlotSelected: (p0) {
                            _.selectedTimeSlot = p0;
                            _.update();
                          },
                        ),
                      ),
                    ContactCardView(),
                    SpacerH(70.h),
                  ],
                ),
              ),
            ),
            Positioned(
                bottom: 20.h,
                left: 20.w,
                right: 20.w,
                child: FadeInUp(
                  child: appButton.PrimaryButton(
                      onClick: () {
                        _.createAppointment();
                      },
                      isloading: _.loading,
                      name: "CONFIRM ( ₹${_.calculatePrice()} )"),
                ))
          ],
        );
      }),
    );
  }
}
