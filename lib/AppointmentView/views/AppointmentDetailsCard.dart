import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/main.dart';

class AppontmentDetailsCard extends StatelessWidget {
  AppontmentDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 274.h,
      width: 386.w,
      padding: EdgeInsets.all(14.w),
    //  margin: EdgeInsets.symmetric(horizontal: 12.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14), color: Colors.white),
    );
  }
}
