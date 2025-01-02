import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Csthumbnail extends StatelessWidget {
  const Csthumbnail({super.key});

  @override
  Widget build(BuildContext context) {
    return   Container(
                          padding: EdgeInsets.all(14),
                          height: 144.h,
                          width: 378.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(14),
                            color: const Color(0xFFFFFFFF)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                appText.primaryText(
                                    text: 'Thumbnail',
                                    fontWeight: FontWeight.w500,
                                    fontSize: 16.sp,
                                    color: const Color(0xFF3D3A38)),

                                    SpacerH(15.h),
                                
                                Container(
                                  alignment: Alignment.center,
                                      height: 79.h,
                                      width: 79.w,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: const Color(0xFFEDECEA),
                                      ),
                                      child: appText.primaryText(
                                                  text: '+',
                                                  fontWeight: FontWeight.w500,
                                                  fontSize: 38.sp,
                                                  color: const Color(0xFF505864B2)),
                                    ),
                              ],
                            ),
                          );
  }
}