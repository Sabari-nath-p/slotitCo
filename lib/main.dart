import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sloti_co/HomeScreen/HomeScreenMain.dart';
import 'package:sloti_co/Login/Model/UserModel.dart';
import 'package:sloti_co/Login/loginscreen.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/endpoint.dart';

String token = "";
var authHead;
String? login;
UserModel? user;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();

  login = preferences.getString("LOGIN");

  if (login == "IN") {
    token = preferences.getString("TOKEN") ?? "";
    print(token);

    authHead = {
      "Authorization": "Bearer $token",
      //"Accept": "application/json",
      "Content-Type": "application/json"
    };
    final Response = await get(Uri.parse(Endpoint.baseUrl + Endpoint.profile),
        headers: authHead);
    print(Response.body);
    try {
      if (Response.statusCode == 200) {
        user = UserModel.fromJson(json.decode(Response.body)["data"]);
      } else {
        token = "";
        authHead = null;
        login = "OUT";
      }
    } catch (e) {
      token = "";
      authHead = null;
      login = "OUT";
    }
  }
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(414, 896),
        builder: (context, _) {
          return GetMaterialApp(
              theme: ThemeData(
                  primaryColor: appColor.primaryColor,
                  colorScheme: Theme.of(context).colorScheme.copyWith(
                      surface:
                          Colors.white, // Sets the background color to white
                      //  onSurface: Colors.white,
                      primary: appColor.primaryColor),
                  dialogBackgroundColor: Colors.white),
              color: appColor.primaryColor,
              home: (login == "IN") ? HomeScreen() : Loginscreen());
        });
  }
}
