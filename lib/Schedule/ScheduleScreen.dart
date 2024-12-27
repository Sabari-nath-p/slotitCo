import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool select = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(child: Column(
        children: [
          CAppBar(ScreenName: 'Schedule'),
          SpacerH(30.h),
          Expanded(child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: 386.w,
                  height: 50.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.w),
                    color: const Color(0xFFF2F2F2),),
                  child: Stack(
                    children: [
                          AnimatedAlign(
                          alignment:select ? Alignment.centerLeft : Alignment.centerRight,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeInOut,
                          child: Container(
                          margin: EdgeInsets.all(6),
                          width: 185.w,
                          height: 38.h,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                        ),



                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                      select = true;
                                    });
                                    },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                          child: appText.primaryText(
                                             text: 'Past',
                                             fontWeight: FontWeight.w600,
                                             fontSize: 12.sp,
                                              color: select ?const Color(0xFF505864):const Color(0xFF232627)),
                                             
                                      ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                      select = false;
                                });
                                },
                                      child: Container(
                                        width: 50,
                                        height: 50,
                                        color: Colors.transparent,
                                        alignment: Alignment.center,
                                        child: appText.primaryText(
                                            text: 'Upcoming',
                                            fontWeight: FontWeight.w600,
                                            fontSize: 12.sp,
                                            color: select ?const Color(0xFF232627):const Color(0xFF505864)),
                                      ),
                                  ),
                                ),
                            ],
                          ),




                    ],
                  ),
                )

              ],
            ),
          ))
        ],
      )),

    );
  }
}