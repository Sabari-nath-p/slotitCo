import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/CreateAppointment/views/CAChooseService.dart';
import 'package:sloti_co/CreateAppointment/views/CAChooseSpecialist.dart';
import 'package:sloti_co/CreateAppointment/views/CASelectService.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/utils.dart';

class CreateServiceScreen extends StatelessWidget {
  const CreateServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
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
                        
                        Cachooseservice(),
                        SpacerH(17.h),
                        Caselectservice(),
                        SpacerH(13.h),
                        Cachoosespecialist(),
                        SpacerH(100.h)
                        
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20.h,
                  left: 20.w,
                  right: 20.w,
                  child: appButton.PrimaryButton(name: "CONTINUE ( ₹4350 )",))
            ],
          ))
        ])));
  }
}