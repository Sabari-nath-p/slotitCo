import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/HomeScreen/views/appointmentListCard.dart';
import 'package:sloti_co/HomeScreen/views/homeMenuCard.dart';
import 'package:sloti_co/HomeScreen/views/homeWelcomeCard.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/utils.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          CAppBar(),
          SpacerH(30.h),
          Expanded(
              child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 14.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  HomeWelcomeCard(),
                  SpacerH(30.h),
                  HomeMenuCard(),
                  SpacerH(14.h),
                  Container(
                    height: 46.h,
                    width: 358,
                  ),
                  SpacerH(14.h),
                  Container(
                    height: 46.h,
                    width: 358,
                  ),
                  for (int i = 0; i <= 10; i++) Appointmentlistcard()
                ],
              ),
            ),
          ))
        ],
      )),
    );
  }
}
