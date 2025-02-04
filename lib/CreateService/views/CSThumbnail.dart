import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Csthumbnail extends StatelessWidget {
  Csthumbnail({super.key});
  CSSController cssctrl = Get.put(CSSController());

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Row(
            children: [
              if (cssctrl.image != null)
                ClipRRect(
                  borderRadius: BorderRadius.circular(12.r),
                  child: Image.file(
                      File(
                        cssctrl.image!.path,
                      ),
                      width: 78.w,
                      height: 78.w,
                      fit: BoxFit.cover),
                ),
              if (cssctrl.image != null) SpacerW(10.w),
              InkWell(
                onTap: () async {
                  cssctrl.image = await ImagePicker()
                      .pickImage(source: ImageSource.gallery);

                  cssctrl.update();
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 79.h,
                  width: 79.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: const Color(0xFFEDECEA),
                  ),
                  child: cssctrl.image != null
                      ? Icon(Icons.change_circle_sharp,
                          color: const Color(0xFF505864B2))
                      : appText.primaryText(
                          text: '+',
                          fontWeight: FontWeight.w500,
                          fontSize: 38.sp,
                          color: const Color(0xFF505864B2)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
