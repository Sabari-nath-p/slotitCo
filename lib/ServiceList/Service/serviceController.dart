import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/ServiceList/Models/ServiceModel.dart';
import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/main.dart';

import '../../src/endpoint.dart';

class Servicecontroller extends GetxController {
  List<ShopServiceModel> shopservicelist = [];
  List<ServiceModel> serviceList = [];
  List<RoomModel> roomList = [];
  bool pageLoading = true;

  fetchShopServices() async {
    pageLoading = true;

    try {
      shopservicelist = [];
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.shopService +
              "?filter.shop_id=${user!.shopId}"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"])
          shopservicelist.add(ShopServiceModel.fromJson(rm));
      } else {}
    } catch (e) {}

    pageLoading = false;
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

  fetchRoomList() async {
    try {
      roomList = [];
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.room +
              "?filter.shop_id=${user!.shopId}"),
          headers: authHead);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"]) roomList.add(RoomModel.fromJson(rm));
      } else {}
    } catch (e) {}

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchShopServices();
    fetchService();
    fetchRoomList();
  }
}
