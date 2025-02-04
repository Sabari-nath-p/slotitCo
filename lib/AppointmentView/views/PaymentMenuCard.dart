import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class PaymentMenuCard extends StatelessWidget {
  const PaymentMenuCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 386.w,
      height: 72.h,
      padding: EdgeInsets.all(14.w),
      // margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white),
      child: Row(
        children: [
          Container(
            height: 44.h,
            width: 60.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFFEDECEA)),
          ),
          SpacerW(11.w),
          appText.primaryText(
              text: 'Razor pay ',
              fontWeight: FontWeight.w500,
              fontSize: 14.sp,
              color: const Color(0xFF3D3A38)),
          Spacer(),
          Image.asset(
            'asset/images/check.png',
            height: 28.h,
            width: 28.h,
          )
        ],
      ),
    );
  }
}
