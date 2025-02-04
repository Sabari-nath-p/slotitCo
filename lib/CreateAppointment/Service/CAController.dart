import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/ConfirmAppointment/View/timeCardView.dart';
import 'package:sloti_co/CreateAppointment/Model/TimeSlotModel.dart';
import 'package:sloti_co/CreateAppointment/Model/timeRangeModel.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/ServiceList/Models/ServiceModel.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';
import 'package:sloti_co/src/utils.dart';

class CAController extends GetxController {
  List<RoomModel> roomList = [];
  List<ShopServiceModel> shopservicelist = [];
  List<ServiceModel> serviceList = [];
  TextEditingController searchCtrl = TextEditingController();
  RoomModel? selectedRoom;
  DateTime? selectedDate = DateTime.now();
  TimeRangeModel? selectedTimeRange;
  List<TimeSlotModel> timeSlot = [];
  TextEditingController userName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController noteText = TextEditingController();
  TimeSlotModel? selectedTimeSlot;

  List<TimeRangeModel> TimeRange = [
    TimeRangeModel(
      title: "Morning",
      from: "08:00",
      to: "12:00",
    ),
    TimeRangeModel(
      title: "Noon",
      from: "12:00",
      to: "14:00",
    ),
    TimeRangeModel(
      title: "Evening",
      from: "04:00",
      to: "18:00",
    ),
    TimeRangeModel(
      title: "Night",
      from: "18:00",
      to: "10:00",
    ),
  ];

  // List<ShopServiceModel> selectedSL = [];
  List<String> selectedSSI = []; // selected shop service list

  ServiceModel? selectedService; // selected service type
  fetchRoomList() async {
    String filter =
        "?filter.shop_id=${user!.shopId}&shop_service_ids=${selectedSSI.join(",")}";
    if (selectedSSI.isEmpty) {
      filter = filter + "&shop_service_ids=" + selectedSSI.join(",");
    }
    try {
      roomList = [];
      final response = await get(
          Uri.parse(Endpoint.baseUrl + Endpoint.room + filter),
          headers: authHead);
      print(response.body);
      print(response.body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"]) roomList.add(RoomModel.fromJson(rm));
      } else {}
    } catch (e) {
      print(e);
    }

    update();
  }

  ShopServiceModel? shopServiceIdtoModel(String id) {
    for (ShopServiceModel data in shopservicelist) {
      if (data.id == id) {
        return data;
      }
    }
    return null;
  }

  double calculatePrice({bool isActual = false}) {
    double price = 0;

    for (String id in selectedSSI) {
      ShopServiceModel? model = shopServiceIdtoModel(id);
      if (model != null) {
        if (isActual) {
          price = price + double.parse(model.charge!);
        } else {
          price = price + double.parse(model.strikeThroughCharge!);
        }
      }
    }

    return price;
  }

  fetchShopServices() async {
    String filter = "?filter.shop_id=${user!.shopId}";

    if (selectedService != null)
      filter = filter + "&filter.service_id=${selectedService!.id}";

    try {
      shopservicelist = [];
      final response = await get(
          Uri.parse(Endpoint.baseUrl + Endpoint.shopService + filter),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"])
          shopservicelist.add(ShopServiceModel.fromJson(rm));
      } else {}
    } catch (e) {}

    update();
  }

  fetchService() async {
    try {
      serviceList = [];
      final response = await get(Uri.parse(Endpoint.baseUrl + Endpoint.service),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"]) serviceList.add(ServiceModel.fromJson(rm));
      } else {}
    } catch (e) {}

    update();
  }

  bool slotLoading = false;
  fetchTimeSlot() async {
    try {
      timeSlot = [];
      slotLoading = true;
      update();
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.timeSlot +
              "?date=${formateDate(selectedDate!)}&shop_rooms_id=${selectedRoom!.id}&shop_service_ids=${selectedSSI.join(",")}&time_from=${selectedTimeRange!.from!}&time_to=${selectedTimeRange!.from!}"),
          headers: authHead);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"]) timeSlot.add(TimeSlotModel.fromJson(rm));
      } else {}
    } catch (e) {}
    slotLoading = false;
    //update();
    update();
  }

  bool loading = false;

  checkFill() {
    if (selectedSSI.isEmpty) {
      Fluttertoast.showToast(msg: "Please select a service");
    } else if (selectedRoom == null) {
      Fluttertoast.showToast(msg: "Please select a room");
    } else if (selectedDate == null) {
      Fluttertoast.showToast(msg: "Please select date of service");
    } else if (selectedTimeSlot == null) {
      Fluttertoast.showToast(msg: "Please select time of service");
    } else if (userName.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter customer name");
    } else if (phoneNumber.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please enter custormer number");
    } else if (loading) {
      Fluttertoast.showToast(msg: " Please wait");
    } else {
      return true;
    }

    return false;
  }

  createAppointment() async {
    if (checkFill() == false) {
      return;
    }
    loading = true;
    update();
    try {
      print(Endpoint.baseUrl + Endpoint.createBooking);
      print(authHead);
      final response =
          await post(Uri.parse(Endpoint.baseUrl + Endpoint.createBooking),
              headers: authHead,
              body: json.encode({
                "shop_room_id": selectedRoom!.id!,
                "shop_service_ids": selectedSSI,
                "time_from": selectedTimeSlot!.timeFrom ?? "08:00",
                "time_to": findEndTime(selectedTimeSlot!.timeFrom!),
                "date": DateFormat("yyyy-MM-dd").format(selectedDate!),
                "note": noteText.text,
                "userDetail": {
                  "first_name": userName.text.trim(),
                  "mobile": "+91" + phoneNumber.text.trim()
                }
              }));

      if (response.statusCode == 201) {
        Get.back();
        Get.back();
      } else {
        var data = json.decode(response.body);
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      print(e);
    }

    loading = false;
    update();
  }

  String findEndTime(String startTime) {
    int minute = 0;
    for (var data in selectedSSI) {
      var model = shopServiceIdtoModel(data);
      minute = minute + model!.time!;
    }
    List times = startTime.split(":");
    int hour = int.parse(times[0]);
    int min = int.parse(times[1]);
    DateTime dt =
        DateTime(2025, 01, 01, hour, min).add(Duration(minutes: minute));
    return DateFormat("hh:mm").format(dt);
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchService();
    fetchShopServices();
  }
}
