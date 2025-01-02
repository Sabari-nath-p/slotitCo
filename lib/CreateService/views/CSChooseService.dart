import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Cschooseservice extends StatefulWidget {
  const Cschooseservice({super.key});

  @override
  State<Cschooseservice> createState() => _CschooseserviceState();
}

class _CschooseserviceState extends State<Cschooseservice> {
  bool serviceselect = false;
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 125.h,
      width: 386.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
              text: 'Choose Service Type',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(17.h),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _servivetypebox('asset/images/Haircut.png','Hair Cut'),
              SpacerW(14.w),
              _servivetypebox('asset/images/Haircut.png','Hair Cut'),
              SpacerW(14.w),
              _servivetypebox('asset/images/Haircut.png','Hair Cut'),
              SpacerW(14.w),
              _servivetypebox('asset/images/Haircut.png','Hair Cut'),
            ],
          )
        ],
      ),
    );
  }

  _servivetypebox(String image , text) {
    return InkWell(
      onTap: (){
        setState(() {
          serviceselect=true;
        });
      },
      child: Container(
        height: 86.h,
        width: 86.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color:serviceselect ? Color(0xFF505864):Color(0xFFFFFFFF),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              color: serviceselect ? Color(0xFFFFFFFF):Color(0xFFD6D2CE),
              height: 30.h,
              width: 28.w,
              image),
      
            SpacerH(14.h),
      
      
            appText.primaryText(
                text: text,
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color:serviceselect ?Color(0xFFFFFFFF) :Color(0xFF95918D),),
      
          ],
        ),
      ),
    );
  }
}

 