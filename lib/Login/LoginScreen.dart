import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/Login/service/controller.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/appTextBox.dart';
import 'package:sloti_co/src/utils.dart';

class Loginscreen extends StatelessWidget {
  Loginscreen({super.key});

  AuthController ctrl = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: GetBuilder<AuthController>(builder: (_) {
            return Column(
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
                Apptextbox.tBox(
                    hint: 'test@example.com',
                    keyType: TextInputType.emailAddress,
                    controller: _.emailText),
                SpacerH(20.h),
                appText.primaryText(
                    text: 'Enter your password',
                    fontWeight: FontWeight.w700,
                    fontSize: 13.sp,
                    color: const Color(0xFF000000)),
                SpacerH(7.h),
                Apptextbox.tBox(
                    hint: 'Password',
                    ispassword: true,
                    controller: _.passwordText),
                SpacerH(10.h),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.end,
                //   children: [
                //     SpacerW(10),
                //     appText.primaryText(
                //         text: "Having issues ?",
                //         color: Color(0xFF000000),
                //         fontWeight: FontWeight.w600,
                //         fontSize: 14.sp),
                //     InkWell(
                //       onTap: () {},
                //       child: appText.primaryText(
                //           text: " Reset Password",
                //           color: Color(0xFF505864),
                //           fontWeight: FontWeight.w500,
                //           fontSize: 13.sp),
                //     ),
                //   ],
                // ),
                SpacerH(322.h),

                appButton.PrimaryButton(
                    name: "Sign In",
                    onClick: () {
                      if (_.emailText.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please enter email address");
                      } else if (_.passwordText.text.isEmpty) {
                        Fluttertoast.showToast(
                            msg: "Please enter password address");
                      } else if (_.loading) {
                        return;
                      } else {
                        _.sendLogin();
                      }
                    },
                    isloading: _.loading)
                // InkWell(
                //   onTap: () {
                //     Get.to(
                //       () => HomeScreen(),
                //     );
                //   },
                //   child: Container(
                //     alignment: Alignment.center,
                //     height: 60.h,
                //     width: 350.w,
                //     decoration: BoxDecoration(
                //         color: const Color(0xFF505864),
                //         borderRadius: BorderRadius.circular(10)),
                //     child: appText.primaryText(
                //         text: ,
                //         fontWeight: FontWeight.w700,
                //         fontSize: 20.sp,
                //         color: const Color(0xFFFFFFFF)),
                //   ),
                // )
              ],
            );
          }),
        ),
      ),
    );
  }
}
