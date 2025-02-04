import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class HomeController extends GetxController {
  List<BookingModel> bookingList = [];

  fetchTodayBooking() async {
    bookingList = [];
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "?limit=100&search=${DateFormat("yyyy-MM-dd").format(DateTime.now())}"),
          headers: authHead);

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["data"]) bookingList.add(BookingModel.fromJson(dt));
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
    fetchTodayBooking();
  }
}
