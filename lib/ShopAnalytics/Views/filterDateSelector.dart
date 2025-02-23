import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/ShopAnalytics/Model/FilterTimeModel.dart';
import 'package:sloti_co/ShopAnalytics/Service/AnalyticsController.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';

class FilterDateCard extends StatefulWidget {
  @override
  State<FilterDateCard> createState() => _FilterDateCardState();
}

class _FilterDateCardState extends State<FilterDateCard> {
  AnalyticsController anCtrl = Get.put(AnalyticsController());

  final List<FilterTimeModel> periods = [
    FilterTimeModel(
      name: "Today",
      from: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      to: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    ),
    FilterTimeModel(
      name: "Last Week",
      from: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      to: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: 7))),
    ),
    FilterTimeModel(
      name: "Last Month",
      from: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      to: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: 30))),
    ),
    FilterTimeModel(
      name: "Last Year",
      from: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      to: DateFormat("yyyy-MM-dd")
          .format(DateTime.now().subtract(Duration(days: 356))),
    ),
    FilterTimeModel(
      name: "Custom",
      from: DateFormat("yyyy-MM-dd").format(DateTime.now()),
      to: DateFormat("yyyy-MM-dd").format(DateTime.now()),
    )
  ];

  FilterTimeModel? selectedPeriod;

  DateTime? startDate = DateTime.now();

  DateTime? endDate = DateTime.now();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectedPeriod = periods[0];
  }

  void showCustomDatePicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        title: Text('Select Date Range'),
        content: Container(
          width: 300.w,
          child: GetBuilder<AnalyticsController>(builder: (_) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2025),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) startDate = date;
                    setState(() {});
                    anCtrl.update();
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Start Date',
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 4.h),
                            Text(DateFormat("yyyy-MM-dd").format(startDate!)),
                          ],
                        ),
                        Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 16.h),
                InkWell(
                  onTap: () async {
                    final date = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime.now(),
                    );
                    if (date != null) endDate = date;

                    setState(() {
                      print(date);
                    });
                    anCtrl.update();
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('End Date',
                                style: TextStyle(color: Colors.grey)),
                            SizedBox(height: 4.h),
                            Text(DateFormat("yyyy-MM-dd").format(endDate!)),
                          ],
                        ),
                        Icon(Icons.calendar_today, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (startDate != null && endDate != null) {
                anCtrl.startDate = DateFormat("yyyy-MM-dd").format(startDate!);
                anCtrl.endDate = DateFormat("yyyy-MM-dd").format(endDate!);
                anCtrl.FetchRoomAnalytics();
                anCtrl.FetchServiceAnalytics();
                anCtrl.FetchShopAnalytics();
                Navigator.pop(context);
              }
            },
            child: Text('Apply'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.w,
      // height: 90.h,
      padding: EdgeInsets.all(16.w),
      child: DropdownButtonFormField(
        isDense: true,
        value: selectedPeriod,
        decoration: InputDecoration(border: InputBorder.none),
        items: periods.map((FilterTimeModel period) {
          return DropdownMenuItem(
            value: period,
            child: appText.primaryText(text: period.name!, fontSize: 12.sp),
          );
        }).toList(),
        onChanged: (FilterTimeModel? value) {
          if (value != null) {
            selectedPeriod = value;
            if (value.name == 'Custom') {
              showCustomDatePicker(context);
            } else {
              selectedPeriod = value;
              anCtrl.startDate = value.to!;
              anCtrl.endDate = value.from!;
              anCtrl.FetchRoomAnalytics();
              anCtrl.FetchServiceAnalytics();
              anCtrl.FetchShopAnalytics();
              // Handle other period selections
            }
          }
        },
      ),
    );
  }
}
