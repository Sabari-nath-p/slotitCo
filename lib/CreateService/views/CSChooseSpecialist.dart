import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Cschoosespecialist extends StatelessWidget {
  const Cschoosespecialist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 168.h,
      width: 386.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFFFFFFF),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Padding(padding: EdgeInsets.fromLTRB(14, 14, 0, 10),
           child: appText.primaryText(
              text: 'Choose Specialist',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF3D3A38)),
           ),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _specialistbox(),
              _specialistbox(),
              _specialistbox(),
              _specialistbox(),
              
            ],
          )
        ],
      ),
      
    );
  }

 _specialistbox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: EdgeInsets.all(7.w),
              height: 79.h,
              width: 79.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                 color: const Color(0xFFEDECEA),
              ),
            ),
    
            appText.primaryText(
              text: 'Wisteria',
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0xFF3D3A38)),
      ],
    );
  }
}