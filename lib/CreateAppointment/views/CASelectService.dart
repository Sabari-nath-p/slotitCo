import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/ServiceList/views/serviceSearchBar.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Caselectservice extends StatelessWidget {
  Caselectservice({super.key});
  CAController caCtrl = Get.put(CAController());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(13),
      height: 800.h,
      width: 384.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color(0xFFFFFFFF)),
      child: Column(
        children: [
          Row(
            children: [
              appText.primaryText(
                  text: 'Select Services',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xFF3D3A38)),
              Spacer(),
              if (caCtrl.selectedSSI.isNotEmpty)
                FadeInRight(
                  child: FadeOutRight(
                    child: appText.primaryText(
                        text: '${caCtrl.selectedSSI.length} Selected',
                        fontWeight: FontWeight.w500,
                        fontSize: 14.sp,
                        color: const Color(0xFF3D3A38)),
                  ),
                ),
            ],
          ),
          SpacerH(14.h),
          ServiceSearchBar(
            Controller: caCtrl.searchCtrl,
            onchanged: () {
              caCtrl.update();
            },
          ),
          Container(
            width: double.infinity,
            height: 600.h,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  for (ShopServiceModel model in caCtrl.shopservicelist)
                    if (model.name!
                            .toLowerCase()
                            .contains(caCtrl.searchCtrl.text.toLowerCase()) ||
                        caCtrl.searchCtrl.text.isEmpty)
                      InkWell(
                          onTap: () {
                            if (caCtrl.selectedSSI.contains(model.id)) {
                              //  caCtrl.selectedSL.remove(model);
                              caCtrl.selectedSSI.remove(model.id);
                            } else {
                              // caCtrl.selectedSSI.contains(model.id);
                              caCtrl.selectedSSI.add(model.id!);
                            }
                            caCtrl.update();
                          },
                          child: _services(model))
                ],
              ),
            ),
          ),
          SpacerH(5.h),
          Row(
            children: [
              SpacerW(40.w),
              Spacer(),
              Container(
                width: 40.w,
                child: InkWell(
                    onTap: () {
                      caCtrl.selectedSSI.clear();
                      caCtrl.update();
                    },
                    child: (caCtrl.selectedSSI.isEmpty)
                        ? Container()
                        : FadeInRight(
                            child: appText.primaryText(text: "Clear"))),
              ),
            ],
          )
        ],
      ),
    );
  }

  Column _services(ShopServiceModel model) {
    return Column(
      children: [
        SpacerH(14.h),
        Container(
          height: 96.h,
          width: 373.w,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 52.h,
                    width: 52.w,
                    child: model.image != null && model.image != ""
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              model.image!,
                              fit: BoxFit.cover,
                            ),
                          )
                        : ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              "asset/images/image.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xFFEDECEA)),
                  ),
                  SpacerW(15.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appText.primaryText(
                          text: model.name,
                          fontWeight: FontWeight.w600,
                          fontSize: 16.sp,
                          color: const Color(0xFF000000)),
                      appText.primaryText(
                          text: model.gender,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: const Color(0x7D000080)),
                    ],
                  ),
                  Spacer(),
                  Container(
                    width: 20.w,
                    height: 20.w,
                    decoration: BoxDecoration(
                      border: Border.all(color: appColor.primaryColor),
                      color: (caCtrl.selectedSSI.contains(model.id))
                          ? appColor.primaryColor
                          : null,
                      borderRadius: BorderRadius.circular(100),
                    ),
                    alignment: Alignment.center,
                    child: (caCtrl.selectedSSI.contains(model.id))
                        ? Icon(
                            Icons.check,
                            size: 12.sp,
                            color: Colors.white,
                          )
                        : Container(
                            width: 10.w,
                            height: 10.w,
                            decoration: BoxDecoration(
                              border: Border.all(color: appColor.primaryColor),
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                  )
                ],
              ),
              SpacerH(10.h),
              Row(
                children: [
                  appText.primaryText(
                      text: '₹ ${model.charge}',
                      fontWeight: FontWeight.w600,
                      fontSize: 17.sp,
                      color: const Color(0xFF000000)),
                  SpacerW(15.w),
                  if (model.charge != model.strikeThroughCharge &&
                      model.strikeThroughCharge != "" &&
                      model.strikeThroughCharge != null)
                    appText.primaryText(
                        text: '₹ ${model.strikeThroughCharge}',
                        fontWeight: FontWeight.w400,
                        fontSize: 13.sp,
                        decoration: TextDecoration.lineThrough,
                        color: const Color(0xFF000000)),
                  Spacer(),
                  appText.primaryText(
                      text: '${model.time} Mins',
                      fontWeight: FontWeight.w600,
                      fontSize: 13.sp,
                      color: const Color(0xFF000000)),
                ],
              ),
            ],
          ),
        ),
        Image.asset(width: 358.w, 'asset/images/line.png')
      ],
    );
  }
}
