import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/StaffScreen/service/controller.dart';

class StaffFilterChip extends StatelessWidget {
  bool isSelected;
  String label;
  StaffFilterChip({
    super.key,
    this.isSelected = false,
    this.label = "name",
  });

  StaffController sctrl = Get.put(StaffController());

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        sctrl.selectedFilter = label;
        sctrl.update();
      },
      child: Container(
        margin: EdgeInsets.only(right: 8.w),
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: isSelected ? Color(0xFF515B6B) : Color(0xFFF4F5F7),
          borderRadius: BorderRadius.circular(20.r),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 14.sp,
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
    ;
  }
}
