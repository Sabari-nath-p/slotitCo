import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ServiceItemView extends StatelessWidget {
  const ServiceItemView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 377.w,
      height: 115.h,
      child: Row(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              color: const Color(0xFFEDECEA),
              borderRadius: BorderRadius.circular(14)),
            
          ),

          SpacerW(15.w),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appText.primaryText(
                    text: 'Name of Service',
                    fontWeight: FontWeight.w700,
                    fontSize: 16.sp,
                    color: const Color(0xFF000000)),
              appText.primaryText(
                    text: 'Loram leads the digital transformation of track maintenance.....',
                    fontWeight: FontWeight.w500,
                    fontSize: 12.sp,
                    color: const Color(0xFF000000)),
              appText.primaryText(
                    text: 'Rs 6400',
                    fontWeight: FontWeight.w600,
                    fontSize: 17.sp,
                    color: const Color(0xFF000000)),
              
            ],
          ),
        ],
      ),
    );
  }
}
