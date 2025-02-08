import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/CreateService/CreateServiceScreen.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/ServiceList/Service/serviceController.dart';
import 'package:sloti_co/ServiceList/views/ServiceItemView.dart';
import 'package:sloti_co/ServiceList/views/serviceSearchBar.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/utils.dart';

class ServiceListView extends StatefulWidget {
  ServiceListView({super.key});

  @override
  State<ServiceListView> createState() => _ServiceListViewState();
}

class _ServiceListViewState extends State<ServiceListView> {
  Servicecontroller ctrl = Get.put(Servicecontroller());
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Color(0xffFAFAFA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, size: 24.sp, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'My Services',
          style: TextStyle(
            fontSize: 18.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        actions: [],
      ),
      body: SafeArea(
        child: Column(
          children: [
            SpacerH(20.h),
            ServiceSearchBar(
              Controller: searchController,
              onchanged: () {
                setState(() {});
              },
            ),
            SpacerH(15.h),
            Expanded(
                child: Stack(
              children: [
                Positioned(
                    top: 0,
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child: GetBuilder<Servicecontroller>(builder: (_) {
                      return SingleChildScrollView(
                        child: Column(
                          children: [
                            for (ShopServiceModel model in _.shopservicelist)
                              if (searchController.text.isEmpty ||
                                  model.name!.toLowerCase().contains(
                                      searchController.text.toLowerCase()))
                                ServiceItemView(
                                  model: model,
                                ),
                            if (!_.pageLoading && _.shopservicelist.isEmpty)
                              Container(
                                height: 500.h,
                                alignment: Alignment.center,
                                child: appText.primaryText(
                                    text:
                                        "Currenlty no shop service in you shop. Please create \nservice to continue",
                                    fontSize: 14.sp),
                              ),
                            SpacerH(100.h)
                          ],
                        ),
                      );
                    })),
                Positioned(
                    bottom: 20.h,
                    right: 20.w,
                    left: 20.w,
                    child: appButton.PrimaryButton(
                        name: "Create Service",
                        onClick: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CreateServiceScreen(),
                            ),
                          );
                        }))
              ],
            ))
          ],
        ),
      ),
    );
  }
}
