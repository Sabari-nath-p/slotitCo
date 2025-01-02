import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Csenterdetails extends StatelessWidget {
  const Csenterdetails({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      child: Column(
        children: [
          _CStextbox('Enter name of  service','Hair cutting.....'),

          Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacerH(12.h),
            appText.primaryText(
                text: 'About Service',
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
                color: const Color(0xFF000000)),
            SpacerH(7.h),
            Container(
              padding: EdgeInsets.only(left: 14),
              height: 117.h,
              width: 378.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF5F5F5)
              ),
        
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: 'write about service ...',
                  hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        ),
           _CStextbox('Sale Cost of Service','Cost of service'),
            _CStextbox('Actual Cost of Service','Cost of service'),
             _CStextbox('Duration of Service','in slots range'),
        ],
      ),
    );
  }

_CStextbox(String titlename,hinttext) {
    return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SpacerH(12.h),
            appText.primaryText(
                text: titlename,
                fontWeight: FontWeight.w700,
                fontSize: 13.sp,
                color: const Color(0xFF000000)),
            SpacerH(7.h),
            Container(
              padding: EdgeInsets.all(14),
              height: 50.h,
              width: 378.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: const Color(0xFFF5F5F5)
              ),
        
              child: TextFormField(
                decoration: InputDecoration(
                  hintText: hinttext,
                  hintStyle: GoogleFonts.nunitoSans(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400
                  ),
                  border: InputBorder.none
                ),
              ),
            ),
          ],
        );
  }
}