import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sloti_co/HomeScreen/HomeScreenMain.dart';
import 'package:sloti_co/Login/Model/UserModel.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/endpoint.dart';

class AuthController extends GetxController {
  bool loading = false;
  TextEditingController emailText = TextEditingController();
  TextEditingController passwordText = TextEditingController();
  sendLogin() async {
    loading = true;
    update();
    print(
        {"email": emailText.text.trim(), "password": passwordText.text.trim()});
    try {
      final Response = await post(Uri.parse(Endpoint.baseUrl + Endpoint.auth),
          headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
          },
          body: json.encode({
            "email": emailText.text.trim(),
            "password": passwordText.text.trim()
          }));

      if (Response.statusCode == 201) {
        Fluttertoast.showToast(msg: "Logined Successful");
        loading = false;
        user = UserModel.fromJson(json.decode(Response.body)["data"]["user"]);
        SharedPreferences pref = await SharedPreferences.getInstance();
        pref.setString("LOGIN", "IN");

        pref.setString(
          "USER_ID",
          user!.id ?? "",
        );
        pref.setString(
          "EMAIL",
          user!.email ?? "",
        );

        token = json.decode(Response.body)["data"]["tokens"]["access_token"];
        pref.setString("TOKEN", token);
        authHead = {
          "Authorization": "Bearer $token",
          "Accept": "application/json",
          "Content-Type": "application/json"
        };
        Get.to(() => HomeScreen(), transition: Transition.rightToLeft);
        update();
      } else {
        Fluttertoast.showToast(
            msg: json.decode(Response.body)["message"] ??
                "server error, please try after some times");
        loading = false;
        update();
      }
    } catch (e) {
      loading = false;
      update();
    }
  }
}
