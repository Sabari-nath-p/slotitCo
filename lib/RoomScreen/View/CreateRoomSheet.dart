import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sloti_co/RoomScreen/Model/roomModel.dart';
import 'package:sloti_co/RoomScreen/service/RMcontroller.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';

import '../../src/appTextBox.dart';
import '../../src/utils.dart';

class CreateRoomSheet extends StatefulWidget {
  RoomModel? model;
  CreateRoomSheet({this.model});

  @override
  State<CreateRoomSheet> createState() => _CreateRoomSheetState();
}

class _CreateRoomSheetState extends State<CreateRoomSheet> {
  TextEditingController roomName = TextEditingController();

  TextEditingController description = TextEditingController();

  XFile? file;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.model != null) {
      roomName.text = widget.model!.name ?? "";
      description.text = widget.model!.description ?? "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: GetBuilder<RMcontroller>(builder: (_) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 20.h),
              Center(
                child: Container(
                  width: 40.w,
                  height: 4.h,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(2.r),
                  ),
                ),
              ),
              SizedBox(height: 20.h),
              Center(
                child: appText.primaryText(
                  text: 'Create Room',
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText.primaryText(
                      text: 'Room Name',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                        hint: "Enter room name", controller: roomName),
                    SpacerH(16.h),
                    Text(
                      'Description',
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                        hint: "Enter Description", controller: description),
                    SizedBox(height: 16.h),
                    appText.primaryText(
                      text: 'Room Image',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                    ),
                    SpacerH(8.h),
                    Container(
                      height: 160.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey[300]!),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Stack(
                        alignment: Alignment.topRight,
                        children: [
                          InkWell(
                            onTap: () async {
                              file = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              _.update();
                            },
                            child: Center(
                                child: appText.primaryText(
                                    text: "Add Image",
                                    color: Colors.black,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600)),
                          ),
                          if (file != null)
                            Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.file(
                                    File(
                                      file!.path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ))
                          else if (widget.model != null &&
                              widget.model!.image != null &&
                              widget.model!.image != "")
                            Positioned(
                                top: 0,
                                bottom: 0,
                                right: 0,
                                left: 0,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8.r),
                                  child: Image.network(
                                    widget.model!.image!,
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          Positioned(
                              top: 12.h,
                              right: 12.w,
                              child: InkWell(
                                  onTap: () async {
                                    if (file == null)
                                      file = await ImagePicker().pickImage(
                                          source: ImageSource.gallery);
                                    else {
                                      file = null;
                                      if (widget.model != null) {
                                        widget.model!.image = null;
                                      }
                                    }
                                    _.update();
                                  },
                                  child: CircleAvatar(
                                      radius: 15.w,
                                      backgroundColor: Colors.white,
                                      child: Icon(
                                        file != null ? Icons.delete : Icons.add,
                                        color: Colors.black45,
                                        size: 20.r,
                                      )))),
                        ],
                      ),
                    ),
                    SizedBox(height: 24.h),
                    Container(
                        width: double.infinity,
                        height: 48.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Color(0xFF515B6B),
                        ),
                        child: appButton.PrimaryButton(
                            name: (widget.model != null)
                                ? "Update Room"
                                : "Create Room",
                            isloading: _.loading,
                            onClick: () async {
                              if (roomName.text.isEmpty) {
                                Fluttertoast.showToast(
                                    msg: "Please enter room name");
                              } else if (_.loading) {
                                return;
                              } else {
                                if (widget.model == null) {
                                  String imageUrl = "";
                                  _.loading = true;
                                  _.update();
                                  if (file != null)
                                    imageUrl = await fileUpload(file!.path);
                                  else if (widget.model!.image != null &&
                                      widget.model!.image != "") {
                                    imageUrl = widget.model!.image!;
                                  }
                                  RoomModel md = RoomModel(
                                      shopId: user!.shopId,
                                      name: roomName.text.trim(),
                                      description: description.text.trim(),
                                      image: imageUrl);

                                  _.createRoom(md);
                                } else {
                                  String imageUrl = "";
                                  _.loading = true;
                                  _.update();
                                  if (file != null)
                                    imageUrl = await fileUpload(file!.path);

                                  RoomModel model = RoomModel(
                                      shopId: user!.shopId,
                                      id: widget.model!.id,
                                      name: roomName.text.trim(),
                                      description: description.text.trim(),
                                      image: imageUrl);

                                  _.updateRoom(model);
                                }
                              }
                            })),
                    SizedBox(height: 12.h),
                    Center(
                      child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: appText.primaryText(
                          text: 'Get Back',
                          fontSize: 16.sp,
                          color: Colors.grey[600],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
