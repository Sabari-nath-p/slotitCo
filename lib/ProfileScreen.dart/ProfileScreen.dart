import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sloti_co/MyShopScreen/MyShopScreen.dart';
import 'package:sloti_co/ProfileScreen.dart/Views/DeleteAccountPopup.dart';
import 'package:sloti_co/ProfileScreen.dart/Views/LogoutPopup.dart';
import 'package:sloti_co/main.dart';
import 'package:sloti_co/src/appColor.dart';
import 'package:sloti_co/src/appText.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Login/LoginScreen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            ProfileHeader(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    ProfileOptionsSection(),
                    SizedBox(height: 10.h),
                    //BottomNavigationSection(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      child: Column(
        children: [
          Row(
            children: [
              IconButton(
                icon: Icon(Icons.arrow_back, size: 24.sp),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 40.w,
              )
            ],
          ),
          SizedBox(height: 16.h),
          ProfileAvatar(),
          SizedBox(height: 12.h),
          ProfileInfo(),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}

class ProfileAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          radius: 50.r,
          backgroundColor: appColor.primaryColor,
          child: appText.primaryText(
              text: user!.firstName!.substring(0, 2),
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 24.sp),
          // backgroundImage: const NetworkImage(
          //   'https://images.unsplash.com/photo-1494790108377-be9c29b29330',
          // ),
        ),
        // Positioned(
        //   bottom: 0,
        //   right: 0,
        //   child: Container(
        //     padding: EdgeInsets.all(4.r),
        //     decoration: BoxDecoration(
        //       color: Colors.white,
        //       shape: BoxShape.circle,
        //     ),
        //     child: Icon(
        //       Icons.camera_alt,
        //       size: 20.sp,
        //       color: Colors.black,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}

class ProfileInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          user!.firstName!,
          style: TextStyle(
            fontSize: 24.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          user!.email!,
          style: TextStyle(
            fontSize: 16.sp,
            color: Colors.grey,
          ),
        ),
        SizedBox(height: 16.h),
        // ElevatedButton(
        //   onPressed: () {},
        //   style: ElevatedButton.styleFrom(
        //     backgroundColor: const Color(0xFFE15B5B),
        //     foregroundColor: Colors.white,
        //     minimumSize: Size(200.w, 45.h),
        //     shape: RoundedRectangleBorder(
        //       borderRadius: BorderRadius.circular(30.r),
        //     ),
        //   ),
        //   child: Text(
        //     'Edit Profile',
        //     style: TextStyle(fontSize: 16.sp),
        //   ),
        // ),
      ],
    );
  }
}

class ProfileOptionsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (user!.userType == "shop_owner")
          ProfileOptionItem(
            icon: Icons.account_balance_sharp,
            title: 'My Shopes',
            onTap: () {
              Get.to(() => ShopListingScreen(),
                  transition: Transition.rightToLeft);
            },
          ),
        ProfileOptionItem(
          icon: Icons.file_download_outlined,
          title: 'Share',
          onTap: () {
            launchUrl(Uri.parse("https://slotit.in"));
          },
        ),
        Divider(height: 1.h, thickness: 1, color: Colors.grey[200]),
        ProfileOptionItem(
          icon: Icons.privacy_tip_outlined,
          title: 'Privacy Policy',
          onTap: () {
            launchUrl(Uri.parse("https://www.slotit.in/Privacy-policy.html"));
          },
        ),
        ProfileOptionItem(
          icon: Icons.location_on_outlined,
          title: 'Terms and Conditions',
          onTap: () {
            launchUrl(Uri.parse("https://www.slotit.in/Terms&Conditions.html"));
          },
        ),
        ProfileOptionItem(
          icon: Icons.card_membership_outlined,
          title: 'Help and Support',
          onTap: () {
            launchUrl(Uri.parse("https://www.slotit.in/#contact_support"));
          },
        ),
        Divider(height: 1.h, thickness: 1, color: Colors.grey[200]),
        ProfileOptionItem(
          icon: Icons.delete_outline,
          title: 'Delete Account',
          onTap: () {
            Get.dialog(DeleteAccountDialog(), barrierDismissible: true);
          },
        ),
        ProfileOptionItem(
          icon: Icons.history,
          title: 'Learn more',
          onTap: () {
            launchUrl(Uri.parse("https://www.slotit.in/#contact_support"));
          },
        ),
        ProfileOptionItem(
          icon: Icons.logout,
          title: 'Log out',
          isLogout: true,
          onTap: () async {
            Get.dialog(LogoutpopupView(), barrierDismissible: true);
          },
        ),
      ],
    );
  }
}

class ProfileOptionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final bool isLogout;

  const ProfileOptionItem({
    Key? key,
    required this.icon,
    required this.title,
    required this.onTap,
    this.isLogout = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Row(
          children: [
            Icon(
              icon,
              color: isLogout ? Colors.red : Colors.grey[600],
              size: 24.sp,
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: isLogout ? Colors.red : Colors.grey[700],
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: Colors.grey,
              size: 24.sp,
            ),
          ],
        ),
      ),
    );
  }
}
