import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';

class appButton {
  static Widget PrimaryButton({
    var name,
    bool isloading = false,
    Function? onClick,
  }) =>
      GestureDetector(
        onTap: () {
          if (onClick != null) {
            onClick();
          }
        },
        child: Container(
          width: 390.w,
          alignment: Alignment.center,
          height: 54.h,
          child: isloading
              ? LoadingAnimationWidget.staggeredDotsWave(
                  color: Colors.white, size: 24.sp)
              : appText.primaryText(
                  text: "${name ?? "--:--"}",
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  fontSize: 16.sp),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: appColor.primaryColor),
        ),
      );
}
