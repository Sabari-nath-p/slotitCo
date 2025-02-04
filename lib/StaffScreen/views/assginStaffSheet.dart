import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/RoomScreen/service/RMcontroller.dart';
import 'package:sloti_co/StaffScreen/service/controller.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class AssignRoomSheet extends StatefulWidget {
  AssignRoomSheet({this.userid, this.selectedID});
  String? userid;
  String? selectedID;
  @override
  State<AssignRoomSheet> createState() =>
      _AssignRoomSheetState(selectedModel: selectedID);
}

class _AssignRoomSheetState extends State<AssignRoomSheet> {
  _AssignRoomSheetState({this.selectedModel});
  //final StaffController controller = Get.find();
  RMcontroller ctrl = Get.put(RMcontroller());
  String? selectedModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 600.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.symmetric(vertical: 20.h),
      child: GetBuilder<StaffController>(builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 4.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.r),
              ),
            ),
            SizedBox(height: 20.h),
            appText.primaryText(
              text: 'Select Room',
              fontSize: 20.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(height: 20.h),
            for (RoomModel model in ctrl.roomList)
              RadioListTile(
                value: model.id,
                // selected: model.id = ,
                groupValue: selectedModel,
                onChanged: (value) {
                  setState(() {
                    selectedModel = value;
                  });
                },
                title: appText.primaryText(
                  align: TextAlign.start,
                  text: model.name!,
                  fontSize: 16.sp,
                ),
                activeColor: Colors.blue,
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SpacerH(5.h),
                  appButton.PrimaryButton(
                      name: "ASSIGN ROOM",
                      isloading: _.loading,
                      onClick: () {
                        if (selectedModel == null) {
                          Fluttertoast.showToast(msg: "Please select room");
                        } else if (_.loading) {
                          return 0;
                        } else {
                          _.assginRoom(selectedModel!, widget.userid!);
                        }
                      }),
                  SpacerH(12.h),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Get Back',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
