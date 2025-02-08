import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class RMcontroller extends GetxController {
  bool pageLoading = true;
  bool loading = false;
  RefreshController reloadController = RefreshController(initialRefresh: true);
  List<RoomModel> roomList = [];
  fetchRoomList() async {
    pageLoading = true;
    reloadController.resetNoData();
    roomList = [];
    try {
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

    if (roomList.isEmpty) {
      reloadController.loadNoData();
    }

    pageLoading = false;
    reloadController.refreshCompleted();
    update();
  }

  createRoom(RoomModel model) async {
    try {
      final response = await post(Uri.parse(Endpoint.baseUrl + Endpoint.room),
          body: json.encode({
            "name": model.name,
            "description": model.description,
            "shop_id": model.shopId,
            "image": model.image
          }),
          headers: authHead);
      var data = json.decode(response.body);
      if (response.statusCode == 201) {
        if (data["status"] ?? false) {
          Fluttertoast.showToast(msg: "Room created successfully");
          fetchRoomList();
          Get.back();
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {}
    loading = false;

    update();
  }

  deleteRoom(RoomModel model) async {
    loading = true;
    update();
    try {
      final response = await delete(
          Uri.parse(Endpoint.baseUrl + Endpoint.room + "/${model.id}"),
          headers: authHead);
      var data = json.decode(response.body);
      print(response.body);
      print(response.statusCode);
      if (response.statusCode == 200) {
        if (data["status"] ?? false) {
          Get.back();
          Fluttertoast.showToast(msg: "Room deleted successfully");
          fetchRoomList();
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {}
    loading = false;

    update();
  }

  updateRoom(RoomModel model) async {
    try {
      final response = await patch(
          Uri.parse(Endpoint.baseUrl + Endpoint.room + "/${model.id}"),
          body: json.encode({
            "name": model.name,
            "description": model.description,
            "shop_id": model.shopId,
            "image": model.image
          }),
          headers: authHead);
      print(response.body);
      print(response.statusCode);
      var data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data["status"] ?? false) {
          Fluttertoast.showToast(msg: "Room updated successfully");
          fetchRoomList();
          Get.back();
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {}
    loading = false;

    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    // fetchRoomList();
  }
}
