import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sloti_co/HomeScreen/model/ShopModel.dart';
import 'package:sloti_co/HomeScreen/model/bookingModel.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class HomeController extends GetxController {
  List<BookingModel> bookingList = [];
  List<ShopModel> shopList = [];
  RefreshController controller = RefreshController(initialRefresh: true);

  calculateCost(List<ShopServiceModel> model) {
    double total = 0;
    for (var data in model) {
      total = total + double.tryParse(data.charge!)!.toDouble();
    }
    return total;
  }

  String getTimeBasedGreeting() {
    final hour = DateTime.now().hour;

    if (hour < 12) {
      return 'Good Morning';
    } else if (hour < 17) {
      return 'Good Afternoon';
    } else {
      return 'Good Evening';
    }
  }

  fetchTodayBooking() async {
    bookingList = [];
    try {
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.bookings +
              "?filter.shop_id=${user!.shopId}&limit=100&search=${DateFormat("yyyy-MM-dd").format(DateTime.now())}"),
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
    controller.refreshCompleted();
    update();
  }

  fetchShops() async {
    try {
      final response = await get(Uri.parse(Endpoint.baseUrl + Endpoint.shops),
          headers: authHead);

      print(response.body);
      print(response.statusCode);

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        for (var dt in data["data"]) shopList.add(ShopModel.fromJson(dt));
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
    fetchShops();
  }
}
