import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/utils.dart';

class CreateAppointmentScreen extends StatelessWidget {
  const CreateAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:  Color(0xffFAFAFA),
      body: SafeArea(child: 
      SingleChildScrollView(
        child: Column(
          children: [
            CAppBar(ScreenName: 'Create Appoinment'),
            SpacerH(30.h),
            Expanded(child: 
            Stack(
              children: [
                Positioned(
                  top: 0,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                           
                      ],
                    ),
                  ))
              ],

            ))
          ],
        ),
      )),
    );
  }
}