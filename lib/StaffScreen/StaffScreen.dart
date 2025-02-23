// staff_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/RoomScreen/service/RMcontroller.dart';
import 'package:sloti_co/StaffScreen/model/staffModel.dart';
import 'package:sloti_co/StaffScreen/service/controller.dart';
import 'package:sloti_co/StaffScreen/views/createStaffSheet.dart';
import 'package:sloti_co/StaffScreen/views/staffCard.dart';
import 'package:sloti_co/StaffScreen/views/staffFilterChip.dart';
import 'package:sloti_co/src/utils.dart';

// class StaffController extends GetxController {
//   final selectedRoomIndex = 0.obs;
//   final selectedFilter = "All".obs;

//   void setSelectedRoom(int index) {
//     selectedRoomIndex.value = index;
//   }

//   void setFilter(String filter) {
//     selectedFilter.value = filter;
//   }
// }

class StaffScreen extends StatefulWidget {
  @override
  State<StaffScreen> createState() => _StaffScreenState();
}

class _StaffScreenState extends State<StaffScreen> {
  // final StaffController controller = Get.put(StaffController());
  RMcontroller rmctrl = Get.put(RMcontroller());

  StaffController sfctrl = Get.put(StaffController());
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Shop Staff',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [
          Container(
            width: 30,
            height: 30,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 16.w),
            decoration: BoxDecoration(
              color: Color(0xFF515B6B),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: InkWell(
              child: Icon(Icons.add, size: 24.sp, color: Colors.white),
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => CreateStaffSheet(),
                );
              },
            ),
          ),
        ],
      ),
      body: GetBuilder<StaffController>(builder: (_) {
        return Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF4F5F7),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: Row(
                  children: [
                    Icon(Icons.search, size: 24.sp, color: Colors.grey),
                    SizedBox(width: 8.w),
                    Expanded(
                      child: TextField(
                        controller: controller,
                        onChanged: (Value) {
                          setState(() {});
                        },
                        decoration: InputDecoration(
                          hintText: 'Search Staffs',
                          border: InputBorder.none,
                          hintStyle: TextStyle(
                            fontSize: 16.sp,
                            color: Colors.grey,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (false)
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    StaffFilterChip(
                      label: "All",
                      isSelected: _.selectedFilter == "All",
                    ),
                    for (var data in rmctrl.roomList)
                      StaffFilterChip(
                        label: data.name!,
                        isSelected: _.selectedFilter == data.name,
                      ),
                  ],
                ),
              ),
            SpacerH(10.h),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (StaffModel model in _.staffList)
                        if (controller.text.trim().isEmpty ||
                            model.firstName!
                                .toLowerCase()
                                .contains(controller.text.toLowerCase().trim()))
                          StaffCardView(
                            model: model,
                          )
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
