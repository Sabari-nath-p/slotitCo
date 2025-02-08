import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/ShopAnalytics/Model/RoomAnalyticsModel.dart';
import 'package:sloti_co/ShopAnalytics/Model/ServiceAnalyticsModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class AnalyticsController extends GetxController {
  String totalBooking = "0";
  String totalEarning = "0";
  String startDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String endDate = DateFormat("yyyy-MM-dd").format(DateTime.now());
  String totalUser = "0";
  List<RoomAnalytics> RoomList = [];
  List<ServiceAnalyticsModel> serviceList = [];
  FetchShopAnalytics() async {
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.analytics +
              "/basic?shop_id=${user!.shopId}&from_date=$startDate&to_date=$endDate"),
          headers: authHead);

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        totalBooking =
            data["data"]["totalBookings"].toString().replaceAll("null", "0");
        totalEarning =
            data["data"]["totalAmount"].toString().replaceAll("null", "0");
        totalUser =
            data["data"]["totalClient"].toString().replaceAll("null", "0");
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  FetchRoomAnalytics() async {
    try {
      RoomList.clear();
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.analytics +
              "/shops/${user!.shopId}/rooms?from_date=$startDate&to_date=$endDate"),
          headers: authHead);

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var model in data["data"])
          RoomList.add(RoomAnalytics.fromJson(model));
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  FetchServiceAnalytics() async {
    try {
      serviceList.clear();
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.analytics +
              "/shops/${user!.shopId}/services?from_date=$startDate&to_date=$endDate"),
          headers: authHead);

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        for (var model in data["data"])
          serviceList.add(ServiceAnalyticsModel.fromJson(model));
      }
    } catch (e) {
      print(e);
    }

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    FetchShopAnalytics();
    FetchRoomAnalytics();
    FetchServiceAnalytics();
  }
}
