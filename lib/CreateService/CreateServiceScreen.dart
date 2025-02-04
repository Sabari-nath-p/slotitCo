import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/service/CSSController.dart';
import 'package:sloti_co/CreateService/views/CSChooseGender.dart';
import 'package:sloti_co/CreateService/views/CSChooseService.dart';
import 'package:sloti_co/CreateService/views/CSChooseSpecialist.dart';
import 'package:sloti_co/CreateService/views/CSEnterdetails.dart';
import 'package:sloti_co/CreateService/views/CSSdelete.dart';
import 'package:sloti_co/CreateService/views/CSThumbnail.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/ServiceList/Service/serviceController.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class CreateServiceScreen extends StatefulWidget {
  ShopServiceModel? model;
  CreateServiceScreen({super.key, this.model});

  @override
  State<CreateServiceScreen> createState() => _CreateServiceScreenState();
}

class _CreateServiceScreenState extends State<CreateServiceScreen> {
  CSSController cssctlr = Get.put(CSSController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cssctlr.resetValue();
    if (widget.model != null) {
      cssctlr.cssModel.serviceId = widget.model!.id;
      cssctlr.cssModel.gender = widget.model!.gender;
      cssctlr.cssModel.image = widget.model!.image;
      cssctlr.serviceNameController.text = widget.model!.name ?? "";
      cssctlr.serviceDescription.text = widget.model!.description ?? "";
      cssctlr.serviceCost.text = widget.model!.charge ?? "";
      cssctlr.strikeThorghPrice.text = widget.model!.strikeThroughCharge ?? "";
      cssctlr.durationController.text = (widget.model!.time ?? 0).toString();
      cssctlr.update();
      cssctlr.FetchServiceDetailed(widget.model!.id!);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.white,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
          title: appText.primaryText(
            text: 'Create Shop Service',
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
          actions: [
            if (widget.model != null)
              Container(
                width: 30,
                height: 30,
                alignment: Alignment.center,
                margin: EdgeInsets.only(right: 16.w),
                decoration: BoxDecoration(
                  color: Color(0xFF515B6B),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: InkWell(
                  child: Icon(Icons.delete, size: 24.sp, color: Colors.white),
                  onTap: () {
                    Get.dialog(DeleteShopService(serviceId: widget.model!.id!),
                        barrierDismissible: false);
                  },
                ),
              ),
          ],
        ),
        backgroundColor: Color(0xffFAFAFA),
        body: SafeArea(
            child: Column(children: [
          SpacerH(30.h),
          GetBuilder<Servicecontroller>(builder: (_) {
            return GetBuilder<CSSController>(builder: (__) {
              return Expanded(
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
                            if (widget.model == null) Cschooseservice(),
                            if (widget.model == null) SpacerH(10.h),
                            Csenterdetails(),
                            SpacerH(14.h),
                            CSChooseGender(),
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
                      child: appButton.PrimaryButton(
                        isloading: cssctlr.loading,
                        onClick: () {
                          if (widget.model == null)
                            cssctlr.CreateShopService();
                          else
                            cssctlr.updateShopService(widget.model!.id!);
                        },
                        name: (widget.model != null) ? "UPDATE" : "CREATE",
                      ))
                ],
              ));
            });
          })
        ])));
  }
}
