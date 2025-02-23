import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';

class Cschoosespecialist extends StatelessWidget {
  Cschoosespecialist({super.key});
  CSSController cssctrl = Get.put(CSSController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CSSController>(builder: (_) {
      return Container(
        height: 168.h,
        width: 386.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: const Color(0xFFFFFFFF),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(14, 14, 0, 10),
              child: appText.primaryText(
                  text: 'Choose Room',
                  fontWeight: FontWeight.w500,
                  fontSize: 16.sp,
                  color: const Color(0xFF3D3A38)),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                //  mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (RoomModel model in _.roomList) _specialistbox(model),
                ],
              ),
            )
          ],
        ),
      );
    });
  }

  _specialistbox(RoomModel model) {
    return Container(
      margin: EdgeInsets.only(right: 14.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.white,
        border: cssctrl.cssModel.shopRoomIds!.contains(model.id)
            ? Border.all(color: appColor.primaryColor, width: 2)
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              if (cssctrl.cssModel.shopRoomIds == null) {
                cssctrl.cssModel.shopRoomIds = [model.id!];
              } else if (cssctrl.cssModel.shopRoomIds!.contains(model.id)) {
                cssctrl.cssModel.shopRoomIds!.remove(model.id);
              } else {
                cssctrl.cssModel.shopRoomIds!.add(model.id!);
              }
              cssctrl.update();
            },
            child: Container(
              margin: EdgeInsets.all(7.w),
              height: 79.h,
              width: 79.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                color: const Color(0xFFEDECEA),
              ),
              child: model.image != null && model.image != ""
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.network(
                        model.image!,
                        fit: BoxFit.cover,
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(14),
                      child: Image.asset(
                        "asset/images/image.png",
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
          ),
          appText.primaryText(
              text: model.name,
              fontWeight: FontWeight.w500,
              fontSize: 12.sp,
              color: Color(0xFF3D3A38)),
        ],
      ),
    );
  }
}
