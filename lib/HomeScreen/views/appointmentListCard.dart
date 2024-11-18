import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appText.dart';

class Appointmentlistcard extends StatelessWidget {
  const Appointmentlistcard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386.w,
      margin: EdgeInsets.only(bottom: 13.h),
      height: 158.h,
      decoration: BoxDecoration(
        color: const Color(0xFFF3F4F4),
        borderRadius: BorderRadius.circular(14)
      ),
      child: Column(
        children: [

          appText.primaryText(
              text: 'Appointment Date', fontWeight: FontWeight.w500, fontSize: 12.sp,color: const Color(0xFF757D7F)),


          Row(
            children: [
              Image.asset('asset/images/clock.png',height: 14.h,width: 14.w,),
              appText.primaryText(
                  text: 'Mon, July 21 - 09:00 - 10:45 AM', fontWeight: FontWeight.w400, fontSize: 12.sp,color: const Color(0xFF757D7F)),
            ],
          ),
          
          Image.asset('asset/images/line.png',height: 1.h,width: 358.w,),

          appText.primaryText(
              text: 'Sabarinath P', fontWeight: FontWeight.w500, fontSize: 14.sp,color: const Color(0x232627)),
          
          appText.primaryText(
              text: 'Hair Cut , Colouring , Facial', fontWeight: FontWeight.w400, fontSize: 12.sp,color: const Color(0xFF757D7F)),

        ],
      ),
    );
  }
}
