import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class BKController extends GetxController {
  List<BookingModel> bookingList = [];
  RefreshController refreshController = RefreshController(initialRefresh: true);
  int lastPage = 0;
  DateTime selectedDate = DateTime.now();
  bool statusLoading = false;
  fetchBooking({String filter = ""}) async {
    refreshController..resetNoData();
    lastPage = 1;
    bookingList = [];
    print("fetchBooking");
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "?limit=20&page=${lastPage}&search=${filter}"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["data"]) bookingList.add(BookingModel.fromJson(dt));

        if (bookingList.isEmpty) {
          refreshController.loadNoData();
        } else {
          lastPage++;
          refreshController.loadComplete();
          refreshController.refreshCompleted();
        }
      }
    } catch (e) {
      print(e);
    }
    update();
  }

  loadMore({String filter = ""}) async {
    // refreshController..resetNoData();
    // bookingList = [];
    print(lastPage);
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "?limit=20&page=${lastPage}&search=${filter}"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["data"]) bookingList.add(BookingModel.fromJson(dt));

        if (data["data"].isEmpty) {
          refreshController.loadNoData();
        } else {
          lastPage++;
          refreshController.loadComplete();
        }
      }
    } catch (e) {}
    update();
  }
}
