import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/src/appText.dart';

class AnalyticCard extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;

  AnalyticCard({
    required this.title,
    required this.value,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          appText.primaryText(
            text: title,
            fontSize: 14.sp,
            color: Colors.grey[600],
          ),
          SizedBox(height: 5.h),
          appText.primaryText(
            text: value,
            fontSize: 18.sp,
            fontWeight: FontWeight.bold,
          ),
          SizedBox(height: 4.h),
          appText.primaryText(
            text: subtitle,
            fontSize: 12.sp,
            color: Colors.grey[500],
          ),
        ],
      ),
    );
  }
}
