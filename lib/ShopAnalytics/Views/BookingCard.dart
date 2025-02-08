import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/ShopAnalytics/Service/AnalyticsController.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BookingChart extends StatelessWidget {
  AnalyticsController anCtrl = Get.put(AnalyticsController());
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        appText.primaryText(
          text: 'Service Analytics',
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
        ),
        appText.primaryText(
          text: 'Booking vs Service analytics',
          fontSize: 14.sp,
          color: Colors.grey[600],
        ),
        SizedBox(height: 16.h),
        Container(
          height: 220.h,
          width: 380.w,
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: SfCartesianChart(
            plotAreaBorderWidth: 0,
            
            primaryXAxis: CategoryAxis(
              majorGridLines: const MajorGridLines(width: 0),
              labelStyle: TextStyle(fontSize: 10.sp),
              labelRotation: 0,
            ),
            primaryYAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              isVisible: false,
            ),
            series: <CartesianSeries>[
              SplineAreaSeries<dynamic, String>(
                dataSource: anCtrl.serviceList,
                xValueMapper: (dynamic data, _) => data.shopServiceName,
                yValueMapper: (dynamic data, _) => data.bookingsCount,
                color: Colors.red.shade200.withOpacity(0.3),
                borderColor: Colors.red.shade200,
                borderWidth: 2,
              ),
            ],
          ),
        )
      ],
    );
  }
}
