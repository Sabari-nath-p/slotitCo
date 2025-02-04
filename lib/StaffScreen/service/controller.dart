import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:sloti_co/StaffScreen/model/staffModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class StaffController extends GetxController {
  bool pageLoading = false;
  bool loading = false;
  List<StaffModel> staffList = [];
  String selectedFilter = "All";
  fetchUser() async {
    pageLoading = true;

    try {
      staffList = [];
      final response = await get(
          Uri.parse(
              Endpoint.baseUrl + Endpoint.staff + "?shop_id=${user!.shopId}"),
          headers: authHead);

      if (response.statusCode == 200) {
        var data = json.decode(response.body);

        for (var rm in data["data"]) staffList.add(StaffModel.fromJson(rm));
      } else {}
    } catch (e) {}

    pageLoading = false;
    update();
  }

  createRoom(StaffModel model) async {
    loading = true;
    update();
    try {
      final response =
          await post(Uri.parse(Endpoint.baseUrl + Endpoint.createStaff),
              body: json.encode({
                "first_name": model.firstName,
                "last_name": model.lastName,
                "email": model.email,
                "phone": model.phone,
                "password": model.password,
                "shop_id": model.shopId
              }),
              headers: authHead);
      var data = json.decode(response.body);

      if (response.statusCode == 201) {
        if (data["status"] ?? false) {
          Fluttertoast.showToast(msg: "staff created successfully");
          fetchUser();
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

  assginRoom(String roomId, String userID) async {
    loading = true;
    update();
    try {
      final response = await post(
          Uri.parse(
              Endpoint.baseUrl + Endpoint.room + "/$roomId/" + "add-admin"),
          body: json.encode({"user_id": "$userID"}),
          headers: authHead);
      var data = json.decode(response.body);

      if (response.statusCode == 201) {
        if (data["status"] ?? false) {
          Fluttertoast.showToast(msg: "staff assigned successfully");
          fetchUser();
          Get.back();
        } else {
          Fluttertoast.showToast(msg: data["message"]);
        }
      } else {
        Fluttertoast.showToast(msg: data["message"]);
      }
    } catch (e) {
      print(e);
    }
    loading = false;

    update();
  }

  updateStaffStatus(bool status, String staffId) async {
    loading = true;
    update();
    try {
      final response = await post(
          Uri.parse(Endpoint.baseUrl + "/users/${staffId}/update-status"),
          body: json.encode({"is_active": (status) ? 1 : 0}),
          headers: authHead);
      var data = json.decode(response.body);

      if (response.statusCode == 201) {
        if (data["status"] ?? false) {
          Fluttertoast.showToast(msg: "staff status changed successfully");
          fetchUser();
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
    fetchUser();
  }
}
