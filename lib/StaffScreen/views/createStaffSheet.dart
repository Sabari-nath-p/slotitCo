import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:sloti_co/StaffScreen/model/staffModel.dart';
import 'package:sloti_co/StaffScreen/service/controller.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appButtons.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:sloti_co/src/appTextBox.dart';
import 'package:sloti_co/src/utils.dart';

class CreateStaffSheet extends StatefulWidget {
  @override
  State<CreateStaffSheet> createState() => _CreateStaffSheetState();
}

class _CreateStaffSheetState extends State<CreateStaffSheet> {
  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController phonecontroller = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  StaffController sctrl = Get.put(StaffController());

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
      child: GetBuilder<StaffController>(builder: (_) {
        return SingleChildScrollView(
          child: Column(
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
              appText.primaryText(
                text: 'Create Staff',
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
              Padding(
                padding: EdgeInsets.all(24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    appText.primaryText(text: "Staff Name"),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                      controller: nameController,
                      hint: 'Enter Staff Name',
                    ),
                    SpacerH(16.h),
                    appText.primaryText(
                      text: "Email",
                    ),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                        hint: 'Enter Staff Email', controller: emailController),
                    SpacerH(16.h),
                    appText.primaryText(text: "Phone"),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                        hint: 'Enter Staff Phone', controller: phonecontroller),
                    SpacerH(16.h),
                    appText.primaryText(text: "Password"),
                    SpacerH(8.h),
                    Apptextbox.tBox(
                        hint: 'Enter Staff Password',
                        controller: passwordController),
                    SpacerH(16.h),
                    SizedBox(height: 24.h),
                    appButton.PrimaryButton(
                        isloading: _.loading,
                        name: "CREATE STAFF",
                        onClick: () {
                          if (nameController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Please enter staff name');
                            return false;
                          } else if (emailController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Please enter staff email');
                            return false;
                          } else if (phonecontroller.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Please enter staff phone');
                            return false;
                          } else if (passwordController.text.isEmpty) {
                            Fluttertoast.showToast(
                                msg: 'Please enter staff password');
                            return false;
                          } else if (sctrl.loading) {
                            return false;
                          } else {
                            StaffModel model = StaffModel(
                                firstName: nameController.text.trim(),
                                lastName: "",
                                email: emailController.text.trim(),
                                phone: phonecontroller.text.trim(),
                                shopId: user!.shopId,
                                password: passwordController.text.trim());

                            sctrl.createRoom(model);
                          }
                        }),
                    SizedBox(height: 8.h),
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
          ),
        );
      }),
    );
  }
}
