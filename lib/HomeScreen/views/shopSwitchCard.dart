import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sloti_co/HomeScreen/controller/HomeController.dart';
import 'package:sloti_co/ProfileScreen.dart/ProfileScreen.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/endpoint.dart';
import 'package:sloti_co/src/utils.dart';

class ShopSwitchCard extends StatelessWidget {
  ShopSwitchCard({super.key});
  HomeController ctrl = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Row(
        children: [
          Image.asset(
            "asset/images/logo_1.png",
            color: appColor.primaryColor,
            width: 130.w,
          ),
          Spacer(),
          if (user!.userType == "shop_owner")
            Container(
              width: 100.w,
              child: DropdownButton(
                underline: Container(),
                isExpanded: true,
                value: user!.shopId!,
                //  alignment: Alignment.bottomCenter,
                items: ctrl.shopList!
                    .map((value) => DropdownMenuItem(
                          child: appText.primaryText(text: value.name),
                          value: value.id,
                        ))
                    .toList(),
                onChanged: (Value) async {
                  user!.shopId = Value;
                  final response = await patch(
                      Uri.parse(Endpoint.baseUrl +
                          Endpoint.shops +
                          "/${Value}/" +
                          "mark-as-default"),
                      headers: authHead);

                  print(response.body);
                  print(response.statusCode);

                  if (response.statusCode == 200) {
                    ctrl.controller.requestRefresh();
                    // ctrl.fetchTodayBooking();
                    ctrl.update();
                  }
                },
              ),
            ),
          SpacerW(10.w),
          InkWell(
            onTap: () {
              Get.to(() => ProfileScreen(), transition: Transition.rightToLeft);
            },
            child: CircleAvatar(
              radius: 20.w,
              backgroundColor: appColor.primaryColor,
              child: appText.primaryText(
                  text: user!.firstName!.substring(0, 2), color: Colors.white),
            ),
          )
        ],
      ),
    );
  }
}
