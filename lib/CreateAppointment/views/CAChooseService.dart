import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/appText.dart';

class Cachooseservice extends StatelessWidget {
  const Cachooseservice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 125.h,
      width: 386.w,
      child: Column(
        children: [
          appText.primaryText(
              text: 'Choose Service Type',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF3D3A38)),
        ],
      ),
    );
  }
}