import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/HomeScreen/HomeScreenMain.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
          
              Row(
                children: [
                  appText.primaryText(
                              text: 'Hey',
                              fontWeight: FontWeight.w600,
                              fontSize: 32.sp,
                              color: const Color(0xFF505864)),
                  appText.primaryText(
                              text: ' Buddy👋🏻',
                              fontWeight: FontWeight.w600,
                              fontSize: 32.sp,
                              color: const Color(0xFF000000)),
                ],
              ),
              SpacerH(7.h),
              Row(
                children: [
                  appText.primaryText(
                              text: 'Welcome To',
                              fontWeight: FontWeight.w400,
                              fontSize: 24.sp,
                              color: const Color(0xFF000000)),
                  appText.primaryText(
                              text: ' Slotit CO',
                              fontWeight: FontWeight.w700,
                              fontSize: 24.sp,
                              color: const Color(0xFF000000)),
                ],
              ),
              SpacerH(7.h),
              appText.primaryText(
                          text: 'Crowd is waiting for you...',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.sp,
                          color: const Color(0xFF848484)),
              SpacerH(38.h),
              appText.primaryText(
                          text: 'Enter your registered email id',
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                          color: const Color(0xFF000000)),
              SpacerH(7.h),
          
              _textbox('test@example.com'),
          
              SpacerH(20.h),
              appText.primaryText(
                          text: 'Enter your password',
                          fontWeight: FontWeight.w700,
                          fontSize: 13.sp,
                          color: const Color(0xFF000000)),
              SpacerH(7.h),
              _textbox('Password'),
              SpacerH(10.h),
          
               Row(
                mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        SpacerW(10),
                        appText.primaryText(
                            text: "Having issues ?",
                            color: Color(0xFF000000),
                            fontWeight: FontWeight.w600,
                            fontSize: 14.sp),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: appText.primaryText(
                              text: " Reset Password",
                              color: Color(0xFF505864),
                              fontWeight: FontWeight.w500,
                              fontSize: 13.sp),
                        ),
                      ],
                    ),

              Container(
                child: InkWell(
                  onTap: (){
                    Get.to(()=>HomeScreen(),);
                  },
                  child: Container(
                            alignment: Alignment.center,
                            height: 60.h,
                            width: 350.w,
                            decoration: BoxDecoration(
                              color: const Color(0xFF505864),
                              borderRadius: BorderRadius.circular(10)
                            ),
                            child: appText.primaryText(
                                      text: 'Sign In', 
                                      fontWeight: FontWeight.w700, 
                                      fontSize: 20.sp,
                                      color: const Color(0xFFFFFFFF)),
                          ),
                ),
              )
          
          
              
            ],
          ),
        ),
      ),
    );
  }
}

_textbox(String text) {
    return Container(
            height: 50.h,
            width: 350.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.w),
              color: const Color(0xFFF5F5F5)
            ),
            child: 
            TextField(
              
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: text,
                hintStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              color: Color(0xFF838383)),
              ),
            ),
          );
  }