import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/HomeScreen/HomeScreenMain.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class HomeMenuCard extends StatelessWidget {
  const HomeMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 145.h,
      width: 386.w,
      child: Column(
        children: [
          menucard(),
        ],
      ),
    );
  }

}


 menucard() {
    return Container(
          height: 106.h,
          width: 119.h,
          decoration: BoxDecoration(
            color: const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.circular(14)
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 50.h,
                width: 50.w,
                decoration: BoxDecoration(
                  color: const Color(0xFFEBEDF1),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Image.asset('asset/images/manage.png',height: 30.h,width: 30.w,),
              ),

              SpacerH(14.h),


              appText.primaryText(
              text: "Manage", fontWeight: FontWeight.w500, fontSize: 12.sp)
            ],
          ),
        );
  }