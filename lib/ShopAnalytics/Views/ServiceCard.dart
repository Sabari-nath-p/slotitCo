import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/src/appText.dart';

class ServiceCard extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String title;
  final String duration;
  final String price;

  const ServiceCard({
    required this.icon,
    required this.color,
    required this.title,
    required this.duration,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),
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
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12.w),
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Icon(icon, size: 24.sp),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                appText.primaryText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
                SizedBox(height: 4.h),
                appText.primaryText(
                  text: '$duration Booking • $price  Earnings',
                  fontSize: 12.sp,
                  color: Colors.grey[600],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
