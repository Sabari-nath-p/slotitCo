import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:sloti_co/StaffScreen/model/staffModel.dart';
import 'package:sloti_co/StaffScreen/views/assginStaffSheet.dart';
import 'package:sloti_co/StaffScreen/views/staffStatusChangeCard.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class StaffCardView extends StatelessWidget {
  StaffModel model;
  StaffCardView({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Row(
        children: [
          Container(
            width: 56.w,
            height: 56.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              // border: Border.all(
              //   //..  color: Colors.amber,
              //   width: 2.w,
              // ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.r),
              child: Image.network(
                "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText.primaryText(
                  text: model.firstName,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
                ),
                SpacerH(2.h),
                appText.primaryText(
                  text: model.phone,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
          PopupMenuButton(
            color: Colors.white,
            icon: Icon(Icons.more_vert, color: Colors.grey),
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'assign',
                child: Row(
                  children: [
                    Icon(Icons.room_preferences, size: 20.sp),
                    SizedBox(width: 8.w),
                    Text('Assign Room'),
                  ],
                ),
              ),
              PopupMenuItem(
                value: 'delete',
                child: Row(
                  children: [
                    Icon(Icons.change_circle,
                        color:
                            model.isActive! ? Colors.red : Colors.greenAccent,
                        size: 20.sp),
                    SizedBox(width: 8.w),
                    Text(
                      model.isActive! ? 'Disable Staff' : "Enable Staff",
                      style: TextStyle(
                          color: model.isActive!
                              ? Colors.red
                              : Colors.greenAccent),
                    ),
                  ],
                ),
              ),
            ],
            onSelected: (value) {
              if (value == 'assign') {
                // _showAssignRoomSheet(context);

                showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  builder: (context) => AssignRoomSheet(
                    userid: model.id,
                    selectedID: model.shopRooms!.isEmpty
                        ? null
                        : model.shopRooms!.first.id,
                  ),
                );
              } else if (value == 'delete') {
                // Show delete confirmation dialog
                Get.dialog(
                    Staffstatuschangecard(
                      model: model,
                    ),
                    barrierDismissible: true);
              }
            },
          ),
        ],
      ),
    );
  }
}
