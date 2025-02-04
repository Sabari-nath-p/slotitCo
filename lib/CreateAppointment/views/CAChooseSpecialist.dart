import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class Cachoosespecialist extends StatelessWidget {
  Cachoosespecialist({super.key});

  CAController caController = Get.put(CAController());

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 168.h,
      width: 395.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: const Color(0xFFFFFFFF),
      ),
      child: GetBuilder<CAController>(builder: (_) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(14, 14, 0, 10),
              child: appText.primaryText(
                  text: 'Choose Specialist',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xFF3D3A38)),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14.w, 0, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (RoomModel model in _.roomList ?? [])
                      _specialistbox(model: model),
                  ],
                ),
              ),
            )
          ],
        );
      }),
    );
  }

  _specialistbox({required RoomModel model, bool isSeleted = false}) {
    return InkWell(
      onTap: () {
        caController.selectedRoom = model;
        caController.selectedDate = DateTime.now();
        caController.selectedTimeRange = caController.TimeRange.first;
        caController.update();
        caController.fetchTimeSlot();
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.all(7.w),
            height: 79.h,
            width: 79.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.r),
              color: const Color(0xFFEDECEA),
            ),
            child: model.image != null
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(14.r),
                    child: Image.network(
                      model.image!,
                      fit: BoxFit.fill,
                    ),
                  )
                : null,
          ),
          appText.primaryText(
              text: model.name,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: const Color(0xFF3D3A38)),
          SpacerH(2),
          if (caController.selectedRoom != null &&
              model.id == caController.selectedRoom!.id)
            Container(
              width: 80.w,
              height: 5.h,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  color: appColor.primaryColor),
            )
        ],
      ),
    );
  }
}
