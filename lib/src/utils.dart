import 'dart:io';

import 'package:flutter/widgets.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'package:intl/intl.dart';

Widget SpacerW(double w) => SizedBox(
      width: w,
    );

Widget SpacerH(double h) => SizedBox(
      height: h,
    );

Future<String> fileUpload(String path) async {
  return ImageKit.io(File(path),
      privateKey: "private_/ixEFm8zmvLC+cRnpsQoDFgPdQ0=");
}

String formateDate(DateTime date) => DateFormat("dd-MM-yyyy").format(date);

bool isDateSame(DateTime date1, DateTime date2) =>
    date1.year == date2.year &&
    date1.month == date2.month &&
    date1.day == date2.day;
