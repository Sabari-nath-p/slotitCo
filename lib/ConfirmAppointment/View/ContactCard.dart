import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/appTextBox.dart';
import 'package:sloti_co/src/utils.dart';

class ContactCardView extends StatelessWidget {
  ContactCardView({super.key});
  CAController caCtrl = Get.put(CAController());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 415.w,
      margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 16.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
              text: 'Contact Details',
              fontWeight: FontWeight.w500,
              fontSize: 16.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(10.h),
          Apptextbox.tBox(
              hint: "Enter Customer Name", controller: caCtrl.userName),
          SpacerH(10.h),
          Apptextbox.tBox(
              hint: "Enter Phone Number",
              controller: caCtrl.phoneNumber,
              keyType: TextInputType.number),
          SpacerH(10.h),
          Apptextbox.tBox(
            hint: "Remarks",
            controller: caCtrl.noteText,
          ),
          SpacerH(10.h),
        ],
      ),
    );
  }
}
