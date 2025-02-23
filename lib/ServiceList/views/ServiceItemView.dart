import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/CreateServiceScreen.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ServiceItemView extends StatelessWidget {
  ShopServiceModel model;
  ServiceItemView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(
            () => CreateServiceScreen(
                  model: model,
                ),
            transition: Transition.rightToLeft);
      },
      child: Container(
        width: 377.w,
        height: 115.h,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100.w,
              height: 100.h,
              child: model.image != null && model.image != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.network(
                        model.image!,
                        fit: BoxFit.fill,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(14.r),
                      child: Image.asset(
                        "asset/images/image.png",
                        fit: BoxFit.fill,
                      ),
                    ),
              decoration: BoxDecoration(
                  color: const Color(0xFFEDECEA),
                  borderRadius: BorderRadius.circular(14)),
            ),
            SpacerW(15.w),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      appText.primaryText(
                          text: model.name,
                          fontWeight: FontWeight.w700,
                          fontSize: 16.sp,
                          color: const Color(0xFF000000)),
                      // Image.asset(
                      //   'asset/images/rating.png',
                      //   height: 28.h,
                      //   width: 61.w,
                      // )
                    ],
                  ),
                  SpacerH(6.h),
                  appText.primaryText(
                    text: model.description,
                    align: TextAlign.start,
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: const Color(0xFF000000),
                  ),
                  SpacerH(10.h),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          appText.primaryText(
                              text: 'Rs ${model.charge}',
                              fontWeight: FontWeight.w600,
                              fontSize: 17.sp,
                              color: const Color(0xFF000000)),
                          SpacerW(3.w),
                          if (model.strikeThroughCharge != null &&
                              model.strikeThroughCharge != model.charge &&
                              model.strikeThroughCharge != "")
                            appText.primaryText(
                                text: 'Rs ${model.strikeThroughCharge}',
                                decoration: TextDecoration.lineThrough,
                                fontWeight: FontWeight.w500,
                                fontSize: 13.sp,
                                color: const Color(0xFF000000)),
                        ],
                      ),
                      appText.primaryText(
                          text: '${model.time} Mins',
                          fontWeight: FontWeight.w500,
                          fontSize: 13.sp,
                          color: const Color(0xFF000000)),
                    ],
                  ),
                  SpacerH(10.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
