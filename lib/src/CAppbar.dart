import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:sloti_co/src/appText.dart';

class CAppBar extends StatelessWidget {
  String ScreenName;
  CAppBar({super.key, required this.ScreenName});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 414.w,
      height: 40.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              print("working");
              Get.back();
            },
            child: SizedBox(
              width: 20.w,
              child: const Icon(Icons.arrow_back),
            ),
          ),
          Expanded(child: appText.primaryText(text: ScreenName, fontSize: 10)),
          SizedBox(width: 20.w, child: Icon(Icons.more_vert_rounded)),
        ],
      ),
    );
  }
}
