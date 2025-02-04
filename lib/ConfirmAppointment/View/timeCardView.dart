import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sloti_co/CreateAppointment/CreateAppointmentScreen.dart';
import 'package:sloti_co/CreateAppointment/Model/TimeSlotModel.dart';
import 'package:sloti_co/CreateAppointment/Model/timeRangeModel.dart';
import 'package:sloti_co/CreateAppointment/Service/CAController.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class TimeSlotSelector extends StatefulWidget {
  final List<TimeSlotModel> slots;
  final Function(TimeSlotModel)? onSlotSelected;

  TimeSlotSelector({
    Key? key,
    required this.slots,
    this.onSlotSelected,
  }) : super(key: key);

  @override
  _TimeSlotSelectorState createState() => _TimeSlotSelectorState();
}

class _TimeSlotSelectorState extends State<TimeSlotSelector> {
  int? selectedIndex;
  CAController caCtrl = Get.put(CAController());
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      padding: EdgeInsets.only(bottom: 10),
      width: 384.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14.r), color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
            child: appText.primaryText(
              text: 'Available Slot',
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 16.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  for (TimeRangeModel model in caCtrl.TimeRange)
                    InkWell(
                      onTap: () {
                        caCtrl.selectedTimeRange = model;
                        caCtrl.fetchTimeSlot();
                        caCtrl.update();
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 5.w),
                        width: 90.w,
                        height: 25.h,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.r),
                            color: (model == caCtrl.selectedTimeRange)
                                ? appColor.primaryColor
                                : Color(0xffF6F6F6)),
                        child: appText.primaryText(
                            text: model.title,
                            color: (model == caCtrl.selectedTimeRange)
                                ? Colors.white
                                : null),
                      ),
                    )
                ],
              ),
            ),
          ),
          SpacerH(20.h),
          if (caCtrl.slotLoading)
            Container(
              alignment: Alignment.center,
              child: LoadingAnimationWidget.discreteCircle(
                  color: appColor.primaryColor, size: 25),
            )
          else
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Wrap(
                spacing: 14.0,
                runSpacing: 10.0,
                children: List.generate(
                  widget.slots.length,
                  (index) => _buildTimeSlot(index),
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTimeSlot(int index) {
    final slot = widget.slots[index];
    final isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () {
        if (slot.isAvailable!) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSlotSelected?.call(slot);
        }
      },
      child: Container(
        width: 105.w,
        height: 42.h,
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        decoration: BoxDecoration(
          color: !slot.isAvailable!
              ? Colors.grey[100]
              : isSelected
                  ? const Color(0xFF2B3A55)
                  : Colors.grey[50],
          borderRadius: BorderRadius.circular(14.0),
          border: Border.all(
            color: Colors.grey[200]!,
            width: 1.0,
          ),
        ),
        child: Center(
          child: appText.primaryText(
            text: '${slot.timeFrom}',
            fontSize: 12.sp,
            fontWeight: FontWeight.w500,
            color: !slot.isAvailable!
                ? Colors.grey[400]
                : isSelected
                    ? Colors.white
                    : Colors.grey[700],
            decoration: !slot.isAvailable! ? TextDecoration.lineThrough : null,
          ),
        ),
      ),
    );
  }
}
