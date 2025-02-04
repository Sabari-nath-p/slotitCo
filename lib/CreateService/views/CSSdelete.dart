import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';


class DeleteShopService extends StatelessWidget {
  final String serviceId;

  DeleteShopService({
    required this.serviceId,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: GetBuilder<CSSController>(builder: (_) {
        return Container(
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (_.loading)
                Column(
                  children: [
                    SizedBox(
                        height: 100.h,
                        width: 100.w,
                        child: LoadingAnimationWidget.newtonCradle(
                            color: appColor.primaryColor, size: 24.r)),
                    SizedBox(height: 16.h),
                    Text(
                      'Deleting Shop Service...',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              else
                Column(
                  children: [
                    Icon(
                      Icons.warning_rounded,
                      color: Colors.red,
                      size: 48.sp,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Delete Shop Service',
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Are you sure you want to delete this shop service? This action cannot be undone.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Row(
                      children: [
                        Expanded(
                          child: TextButton(
                            onPressed: () => Get.back(),
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.r),
                                side: BorderSide(color: Colors.grey[300]!),
                              ),
                            ),
                            child: appText.primaryText(
                              text: 'Cancel',
                              fontSize: 16.sp,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              _.deleteShopService(serviceId);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                              padding: EdgeInsets.symmetric(vertical: 12.h),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: Colors.redAccent),
                                borderRadius: BorderRadius.circular(8.r),
                              ),
                            ),
                            child: appText.primaryText(
                              text: 'Delete',
                              color: Colors.redAccent,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        );
      }),
    );
  }
}
