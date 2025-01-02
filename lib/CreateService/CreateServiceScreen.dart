import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/CreateService/views/CSChooseService.dart';
import 'package:sloti_co/CreateService/views/CSChooseSpecialist.dart';
import 'package:sloti_co/CreateService/views/CSEnterdetails.dart';
import 'package:sloti_co/CreateService/views/CSThumbnail.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class CreateServiceScreen extends StatelessWidget {
  const CreateServiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: Color(0xffFAFAFA),
        body: SafeArea(
            child: Column(children: [
          CAppBar(
            ScreenName: "Create Service",
          ),
          SpacerH(30.h),
          Expanded(
              child: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        
                        Cschooseservice(),
                        SpacerH(12.h),
                        Csenterdetails(),
                        SpacerH(14.h),
                        Cschoosespecialist(),
                         SpacerH(29.h),
                         Csthumbnail(),
                        SpacerH(100.h)
                        
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                  bottom: 20.h,
                  left: 20.w,
                  right: 20.w,
                  child: appButton.PrimaryButton(name: "CONTINUE ( ₹4350 )",))
            ],
          ))
        ])));
  }
}