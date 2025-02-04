import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/appTextBox.dart';
import 'package:sloti_co/src/utils.dart';

class Csenterdetails extends StatelessWidget {
  Csenterdetails({super.key});

  CSSController csController = Get.put(CSSController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          _CStextbox(
              hint: 'Service Name',
              controller: csController.serviceNameController),
          _CStextbox(
              hint: "Service Description",
              controller: csController.serviceDescription),
          _CStextbox(
              hint: 'Service Cost', controller: csController.serviceCost),
          _CStextbox(
              hint: "Actual Cost", controller: csController.strikeThorghPrice),
          _CStextbox(
              hint: 'Duration (in min)',
              controller: csController.durationController),
        ],
      ),
    );
  }

  _CStextbox(
      {TextEditingController? controller,
      String? hint,
      bool? ispassword,
      String? prefixText,
      bool? isEnable,
      TextInputType? keyType}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SpacerH(12.h),
        appText.primaryText(
            text: '$hint',
            fontWeight: FontWeight.w500,
            fontSize: 16.sp,
            color: const Color(0xFF3D3A38)),
        SpacerH(7.h),
        Apptextbox.tBox(hint: hint, controller: controller, keyType: keyType)
      ],
    );
  }
}
