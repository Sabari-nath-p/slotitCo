import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sloti_co/CreateService/CreateServiceScreen.dart';
import 'package:sloti_co/ServiceList/views/ServiceItemView.dart';
import 'package:sloti_co/ServiceList/views/serviceSearchBar.dart';
import 'package:sloti_co/src/CAppbar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/utils.dart';

class ServiceListView extends StatelessWidget {
  const ServiceListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFAFAFA),
      body: SafeArea(
        child: Column(
          children: [
            CAppBar(ScreenName: 'Our Service'),
            SpacerH(30.h),
            ServiceSearchBar(),
            SpacerH(15.h),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          for (int i = 0; i < 10; i++) ServiceItemView(),
                          SpacerH(100.h)
                        ],
                      ),
                    )),
                Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    left: 20.w,
                    child: appButton.PrimaryButton(name: "Create Service",onClick: (){CreateServiceScreen();}))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
