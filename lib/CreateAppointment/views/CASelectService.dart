import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/ServiceList/views/serviceSearchBar.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Caselectservice extends StatelessWidget {
  const Caselectservice({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      padding: EdgeInsets.all(13),
      height: 521.h,
      width: 384.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xFFFFFFFF)),
      child: Column(
        children: [

          Row(
            children: [
              appText.primaryText(
                  text: 'Select Services',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xFF3D3A38)),
              Spacer(),
              appText.primaryText(
                  text: '5 Selected',
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: const Color(0xFF3D3A38)),
            ],
          ),

          SpacerH(14.h),

          ServiceSearchBar(),

          _services()


        ],
      ),
    );
  }

  Column _services() {
    return Column(
          children: [
            SpacerH(14.h),
            Container(
              height: 96.h,
              width: 373.w,
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 52.h,
                        width: 52.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(14),
                          color: const Color(0xFFEDECEA)
                        ),
                      ),
                      SpacerW(15.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          appText.primaryText(
                        text: 'Name of Service',
                        fontWeight: FontWeight.w600,
                        fontSize: 16.sp,
                        color: const Color(0xFF000000)),
                  
                        appText.primaryText(
                        text: 'Loram leads the digital transformation of',
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: const Color(0x7D000080)),
                  
                        ],
                      ),
                  
                    ],
                  ),
            
                  SpacerH(10.h),
            
            
                   Row(
                    children: [
                      appText.primaryText(
                    text: '₹ 6400',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: const Color(0xFF000000)),
            
                    SpacerW(15.w),
            
                    appText.primaryText(
                    text: '₹ 6750',
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                    color: const Color(0xFF000000)),
            
                    Spacer(),
            
                    appText.primaryText(
                    text: '20 Mins',
                    fontWeight: FontWeight.w600,
                    fontSize: 13.sp,
                    color: const Color(0xFF000000)),
                    ],
            
                  ),
                ],
              ),
            
            ),
              Image.asset(
                width: 358.w,

                'asset/images/line.png')
          ],
        );
  }
}