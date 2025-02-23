import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/ShopAnalytics/Model/RoomAnalyticsModel.dart';
import 'package:sloti_co/ShopAnalytics/Service/AnalyticsController.dart';
import 'package:sloti_co/ShopAnalytics/Views/AnalyticCard.dart';
import 'package:sloti_co/ShopAnalytics/Views/BookingCard.dart';
import 'package:sloti_co/ShopAnalytics/Views/ServiceCard.dart';
import 'package:sloti_co/ShopAnalytics/Views/filterDateSelector.dart';
import 'package:sloti_co/src/appText.dart';

class AnalyticsPage extends StatelessWidget {
  AnalyticsPage({Key? key}) : super(key: key);
  AnalyticsController anCtrl = Get.put(AnalyticsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Analytics',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: GetBuilder<AnalyticsController>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  appText.primaryText(
                    text: 'Shop Analytics',
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  Spacer(),
                  if (MediaQuery.of(context).size.width < 600) FilterDateCard(),
                ],
              ),
              SizedBox(height: 16.h),
              Row(
                children: [
                  Expanded(
                    child: AnalyticCard(
                      title: 'Total Booking',
                      value: '${anCtrl.totalBooking}',
                      subtitle: '',
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: AnalyticCard(
                      title: 'Total Earning',
                      value: '₹${anCtrl.totalEarning}',
                      subtitle: '',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              AnalyticCard(
                title: 'Total Customers',
                value: '${anCtrl.totalUser}',
                subtitle: '',
              ),
              SizedBox(height: 24.h),
              appText.primaryText(
                text: 'Room Analytics',
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
              ),
              SizedBox(height: 14.h),
              for (var data in anCtrl.RoomList)
                ServiceCard(
                  icon: Icons.cut,
                  color: Colors.purple.shade100,
                  title: data.shopRoomName!,
                  duration: data.totalServicesCount.toString(),
                  price: data.totalAmount.toString(),
                ),
              SizedBox(height: 12.h),
              BookingChart(),
            ],
          );
        }),
      ),
    );
  }
}
