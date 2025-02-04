import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/RoomScreen/View/CreateRoomSheet.dart';
import 'package:sloti_co/RoomScreen/View/RoomCardView.dart';
import 'package:sloti_co/RoomScreen/service/RMcontroller.dart';
import 'package:sloti_co/StaffScreen/StaffScreen.dart';
import 'package:sloti_co/src/appText.dart';

class RoomScreen extends StatelessWidget {
  RoomScreen({Key? key}) : super(key: key);
  RMcontroller roomCtrl = Get.put(RMcontroller());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: appText.primaryText(
          text: 'Shop Rooms',
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black,
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
              child: Icon(Icons.person, size: 24.sp, color: Colors.white),
              onTap: () {
                Get.to(() => StaffScreen(), transition: Transition.rightToLeft);
              },
            ),
          ),
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
                  builder: (context) => CreateRoomSheet(),
                );
              },
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: GetBuilder<RMcontroller>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
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
                          decoration: InputDecoration(
                            hintText: 'Search Rooms',
                            border: InputBorder.none,
                            hintStyle: GoogleFonts.nunitoSans(
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
              Container(
                padding: EdgeInsets.only(right: 20.w),
                alignment: Alignment.centerRight,
                child: appText.primaryText(
                  text: '${_.roomList.length} ROOMS',
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(12.0.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      for (RoomModel model in _.roomList)
                        RoomCard(
                          model: model,
                        )
                    ],
                  ),
                ),
              )),
            ],
          );
        }),
      ),
    );
  }
}
