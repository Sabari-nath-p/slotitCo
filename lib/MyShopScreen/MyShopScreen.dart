// shop_model.dart
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sloti_co/HomeScreen/controller/HomeController.dart';
import 'package:sloti_co/HomeScreen/model/ShopModel.dart';
import 'package:sloti_co/src/appText.dart';

class Shop {
  final String id;
  final String name;
  final String address;
  final String phoneNumber;
  final String imageUrl;
  final String email;

  Shop({
    required this.id,
    required this.name,
    required this.address,
    required this.phoneNumber,
    required this.imageUrl,
    required this.email,
  });
}

// shop_controller.dart

// shop_listing_screen.dart

class ShopListingScreen extends StatelessWidget {
  ShopListingScreen({Key? key}) : super(key: key);

  HomeController ctrl = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text(
          'My Shops',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          // IconButton(
          //   icon: Icon(Icons.add, size: 24.sp),
          //   onPressed: () {
          //     // Handle add new shop
          //   },
          // ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          //  controller.fetchShops();
        },
        child: ListView.builder(
          padding: EdgeInsets.all(16.w),
          itemCount: ctrl.shopList.length,
          itemBuilder: (context, index) {
            final shop = ctrl.shopList[index];
            return ShopCard(shop: shop);
          },
        ),
      ),
    );
  }
}

class ShopCard extends StatelessWidget {
  final ShopModel shop;

  const ShopCard({
    Key? key,
    required this.shop,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12.r),
              topRight: Radius.circular(12.r),
            ),
            child: AspectRatio(
              aspectRatio: 16 / 9,
              child: Image.network(
                shop.image ?? "",
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: Icon(
                      Icons.store,
                      size: 50.sp,
                      color: Colors.grey[500],
                    ),
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        shop.name!,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                ShopInfoRow(
                  icon: Icons.location_on,
                  text: shop.address!.address!,
                ),
                SizedBox(height: 4.h),
                ShopInfoRow(
                  icon: Icons.phone,
                  text: shop.contactPhone!,
                ),
                SizedBox(height: 4.h),
                ShopInfoRow(
                  icon: Icons.email,
                  text: shop.contactEmail!,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ShopInfoRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const ShopInfoRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          size: 16.sp,
          color: Colors.grey[600],
        ),
        SizedBox(width: 8.w),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.grey[700],
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
