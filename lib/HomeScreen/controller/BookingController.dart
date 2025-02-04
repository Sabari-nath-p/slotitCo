import 'dart:convert';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class BKController extends GetxController {
  List<BookingModel> bookingList = [];
  fetchBooking({String filter = ""}) async {
    bookingList = [];
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "?limit=100&search=${filter}"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["data"]) bookingList.add(dt);
      }
    } catch (e) {}
  }
}
