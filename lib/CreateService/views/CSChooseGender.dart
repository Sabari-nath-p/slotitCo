import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/ServiceList/Service/serviceController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class CSChooseGender extends StatelessWidget {
  CSChooseGender({super.key});

  CSSController cssctrl = Get.put(CSSController());

  List gendersList = [
    {"key": "male", "value": "Male"},
    {"key": "female", "value": "female"},
    {"key": "common", "value": "Unisex"},
    {"key": "other", "value": "Other"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.h,
      width: 386.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
              text: 'Choose Gender',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(17.h),
          GetBuilder<Servicecontroller>(builder: (_) {
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var model in gendersList) _servivetypebox(model),
                ],
              ),
            );
          })
        ],
      ),
    );
  }

  _servivetypebox(var model) {
    return Container(
      margin: EdgeInsets.only(right: 14.w),
      child: InkWell(
        onTap: () {
          cssctrl.cssModel.gender = model["key"];
          cssctrl.update();
        },
        child: Container(
          height: 30.h,
          width: 86.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: cssctrl.cssModel.gender == model["key"]
                ? Color(0xFF505864)
                : Color(0xFFFFFFFF),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image.network(
              //     color: cssctrl.cssModel.serviceId == model.id
              //         ? Color(0xFFFFFFFF)
              //         : Color(0xFFD6D2CE),
              //     height: 30.h,
              //     width: 28.w,
              //     model.image!),
              // SpacerH(14.h),
              appText.primaryText(
                text: model["value"],
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: cssctrl.cssModel.gender == model["key"]
                    ? Color(0xFFFFFFFF)
                    : Color(0xFF95918D),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
