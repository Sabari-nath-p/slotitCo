import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sloti_co/ConfirmAppointment/View/calenderViewCard.dart';
import 'package:sloti_co/HomeScreen/views/appointmentListCard.dart';
import 'package:sloti_co/Schedule/controller/BookingController.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  bool select = true;
  BKController bkCtrl = Get.put(BKController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color(0xffFAFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Appointments',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      body: SafeArea(
          child: Column(
        children: [
          //  SpacerH(10.h),
          WeekCalendarView(
            isPrev: true,
            onDateSelected: (p0) {
              bkCtrl.selectedDate = p0;
              bkCtrl.update();
              bkCtrl.fetchBooking(
                  filter: DateFormat("yyyy-MM-dd").format(bkCtrl.selectedDate));
            },
          ),
          Expanded(
              child: SmartRefresher(
            controller: bkCtrl.refreshController,
            enablePullDown: true,
            enablePullUp: true,
            onRefresh: () {
              bkCtrl.fetchBooking(
                  filter: DateFormat("yyyy-MM-dd").format(bkCtrl.selectedDate));
            },
            onLoading: () {
              bkCtrl.loadMore(
                  filter: DateFormat("yyyy-MM-dd").format(bkCtrl.selectedDate));
            },
            child: GetBuilder<BKController>(builder: (_) {
              return SingleChildScrollView(
                child: Column(
                  children: [
                    for (var model in bkCtrl.bookingList)
                      Appointmentlistcard(model: model)
                  ],
                ),
              );
            }),
          ))
        ],
      )),
    );
  }
}
