import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/utils.dart';

class ServiceSearchBar extends StatelessWidget {
   ServiceSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(14.w),
      width: 371.w,
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.w),
         color: const Color(0xFFFFFFFF),
         border: Border.all(color: const Color(0xFFE8E8E8),)
      ),
      child: Row(
        children: [
          Image.asset('asset/images/searchicon.png',
          height: 20.h,
          width: 20.w,
          ),

          SpacerW(14.w),

          Expanded(child: TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Search Services',
              hintStyle: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w400,
              fontSize: 14.sp,
              color: Color(0xFF4B4B4B)),
            ),
          ))
        ],
      ),
    );
  }
}
