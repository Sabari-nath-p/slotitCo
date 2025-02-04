import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/RoomScreen/View/CreateRoomSheet.dart';
import 'package:sloti_co/RoomScreen/View/deleteRoom.dart';
import 'package:sloti_co/src/appText.dart';

class RoomCard extends StatelessWidget {
  RoomModel model;

  RoomCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    appText.primaryText(
                      text: model.name,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                    PopupMenuButton(
                        color: Colors.white,
                        onSelected: (value) {
                          if (value == 1) {
                            print("working");
                            Get.dialog(
                                DeleteRoomDialog(
                                  model: model,
                                ),
                                barrierDismissible: true);
                          } else if (value == 0) {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              backgroundColor: Colors.transparent,
                              builder: (context) => CreateRoomSheet(
                                model: model,
                              ),
                            );
                          }
                        },
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                value: 0,
                                child: appText.primaryText(text: "Edit"),
                              ),
                              PopupMenuItem(
                                value: 1,
                                child: appText.primaryText(text: "Delete"),
                              )
                            ],
                        child: Icon(Icons.more_vert, color: Colors.grey)),
                  ],
                ),
                SizedBox(height: 4.h),
                appText.primaryText(
                  text: '0 Staffs',
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
          if (model.image != null && model.image != "")
            ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
              child: Image.network(
                model.image!,
                height: 160.h,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          if (model.description != null &&
              model.description != "" &&
              (model.image == null || model.image == ""))
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
              child: appText.primaryText(
                text: model.description,
                fontSize: 14.sp,
                color: Colors.grey[600],
              ),
            ),
        ],
      ),
    );
  }
}
