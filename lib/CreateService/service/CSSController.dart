import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sloti_co/CreateService/model/CreateServiceModel.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/ServiceList/Service/serviceController.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';
import 'package:sloti_co/src/utils.dart';

class CSSController extends GetxController {
  CSSModel cssModel = CSSModel(shopRoomIds: []);
  List<RoomModel> roomList = [];
  TextEditingController serviceNameController = TextEditingController();
  TextEditingController serviceDescription = TextEditingController();
  TextEditingController serviceCost = TextEditingController();
  TextEditingController strikeThorghPrice = TextEditingController();
  TextEditingController durationController = TextEditingController();
  XFile? image;
  Servicecontroller ctrl = Get.put(Servicecontroller());

  bool loading = false;

  fetchRoomList() async {
    try {
      roomList = [];
      final response = await get(
          Uri.parse(Endpoint.baseUrl +
              Endpoint.room +
              "?filter.shop_id=${user!.shopId}"),
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

  bool checkData() {
    if (cssModel.serviceId == null || cssModel.serviceId == "") {
      Fluttertoast.showToast(msg: "Please select a service type");

      return true;
    } else if (serviceNameController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please add service name");

      return true;
    } else if (serviceDescription.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please add service description");

      return true;
    } else if (serviceCost.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please add service cost");

      return true;
    } else if (durationController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Please add service duration");

      return true;
    } else if (cssModel.gender == null || cssModel.gender == "") {
      Fluttertoast.showToast(msg: "Please select service gender");

      return true;
    } else if (cssModel.shopRoomIds!.isEmpty) {
      Fluttertoast.showToast(msg: "Please add atleast one room");
      return true;
    }

    return false;
  }

  CreateShopService() async {
    String imagelink = "";

    if (checkData() == true) {
      loading = false;
      update();
      return false;
    } else if (loading == true) {
      return false;
    } else {
      loading = true;
      update();
      if (image != null) {
        imagelink = await fileUpload(image!.path);
      }
      try {
        final response = await post(
            Uri.parse(Endpoint.baseUrl + Endpoint.shopService),
            headers: authHead,
            body: json.encode({
              "name": serviceNameController.text.trim(),
              "description": serviceDescription.text.trim(),
              "shop_id": user!.shopId,
              "service_id": cssModel.serviceId,
              "time":
                  double.parse(durationController.text.trim()), //in minutes,
              "charge": double.parse(serviceCost.text.trim()),
              "strike_through_charge":
                  double.parse(strikeThorghPrice.text.trim()),
              "gender": cssModel.gender,
              "shop_room_ids": cssModel.shopRoomIds,
              "image": imagelink
            }));
        var data = json.decode(response.body);

        if (response.statusCode == 200 || response.statusCode == 201) {
          if (data["status"] == true) {
            Servicecontroller ctrl = Get.put(Servicecontroller());
            Fluttertoast.showToast(msg: "Shop service created successfully");
            ctrl.fetchShopServices();
            resetValue();
            Get.back();
            loading = false;
          } else {
            Fluttertoast.showToast(msg: data["message"]);
          }
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
    loading = false;
    update();
  }

  FetchServiceDetailed(String shopServiceID) async {
    try {
      final response = await get(
          Uri.parse(
              Endpoint.baseUrl + Endpoint.shopService + "/$shopServiceID"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        List<String> temp = [];
        for (var rm in data["data"]["shopRooms"]) temp.add(rm["id"]);
        cssModel.shopRoomIds = temp;
        update();
      } else {}
    } catch (e) {
      print(e);
    }
  }

  updateShopService(String shopServiceID) async {
    print(shopServiceID);
    loading = true;
    update();
    String imagelink = "";
    if (image != null) {
      imagelink = await fileUpload(image!.path);
    }
    if (checkData() == true) {
      loading = false;
      update();
      return false;
      // } else if (loading == true) {
      //   return false;
    } else {
      try {
        final response = await patch(
            Uri.parse(
                Endpoint.baseUrl + Endpoint.shopService + "/$shopServiceID"),
            headers: authHead,
            body: json.encode({
              "name": serviceNameController.text.trim(),
              "description": serviceDescription.text.trim(),
              //"shop_id": user!.shopId,
              // "service_id": cssModel.serviceId,
              "time":
                  double.parse(durationController.text.trim()), //in minutes,
              "charge": double.parse(serviceCost.text.trim()),
              "strike_through_charge":
                  double.parse(strikeThorghPrice.text.trim()),
              "gender": cssModel.gender,
              "shop_room_ids": cssModel.shopRoomIds,
              "image": imagelink == "" ? cssModel.image : imagelink
            }));
        var data = json.decode(response.body);
        print(response.body);
        print(response.statusCode);
        if (response.statusCode == 200 || response.statusCode == 201) {
          if (data["status"] == true) {
            Fluttertoast.showToast(msg: "Shop service updated successfully");
            ctrl.fetchShopServices();
            Get.back();

            loading = false;
          } else {
            Fluttertoast.showToast(msg: data["message"]);
          }
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } catch (e) {
        Fluttertoast.showToast(msg: e.toString());
      }
    }
    loading = false;
    update();
  }

  deleteShopService(String shopServiceID) async {
    loading = true;
    update();
    try {
      final response = await delete(
          Uri.parse(
              Endpoint.baseUrl + Endpoint.shopService + "/${shopServiceID}"),
          headers: authHead);
      var data = json.decode(response.body);

      if (response.statusCode == 200) {
        if (data["status"] ?? false) {
          Get.back();
          Get.back();
          resetValue();
          ctrl.fetchShopServices();
          Fluttertoast.showToast(msg: "shop service deleted successfully");
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

  resetValue() {
    cssModel = CSSModel(shopRoomIds: []);
    //roomList = [];
    serviceNameController = TextEditingController();
    serviceDescription = TextEditingController();
    serviceCost = TextEditingController();
    strikeThorghPrice = TextEditingController();
    durationController = TextEditingController();
    image = null;
    loading = false;
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    fetchRoomList();
  }
}
