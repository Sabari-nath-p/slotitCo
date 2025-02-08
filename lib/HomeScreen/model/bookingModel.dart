import 'package:sloti_co/ServiceList/Models/ShopServiceModel.dart';
import 'package:sloti_co/StaffScreen/model/staffModel.dart';

class BookingModel {
  String? id;
  String? shopRoomId;
  List<String>? shopServiceIds;
  UserDetail? userDetail;
  String? note;
  String? status;
  bool? isOnline;
  String? timeFrom;
  String? timeTo;
  String? date;
  ShopRooms? shopRoom;
  List<ShopServiceModel>? shopServices;

  BookingModel(
      {this.id,
      this.shopRoomId,
      this.shopServiceIds,
      this.userDetail,
      this.note,
      this.status,
      this.isOnline,
      this.timeFrom,
      this.timeTo,
      this.date,
      this.shopRoom,
      this.shopServices});

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopRoomId = json['shop_room_id'];
    shopServiceIds = json['shop_service_ids'].cast<String>();
    userDetail = json['userDetail'] != null
        ? new UserDetail.fromJson(json['userDetail'])
        : null;
    note = json['note'];
    status = json['status'];
    isOnline = json['is_online'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    date = json['date'];
    shopRoom = json['shopRoom'] != null
        ? new ShopRooms.fromJson(json['shopRoom'])
        : null;
    if (json['shopServices'] != null) {
      shopServices = <ShopServiceModel>[];
      json['shopServices'].forEach((v) {
        shopServices!.add(new ShopServiceModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_room_id'] = this.shopRoomId;
    data['shop_service_ids'] = this.shopServiceIds;
    if (this.userDetail != null) {
      data['userDetail'] = this.userDetail!.toJson();
    }
    data['note'] = this.note;
    data['status'] = this.status;
    data['is_online'] = this.isOnline;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['date'] = this.date;
    if (this.shopRoom != null) {
      data['shopRoom'] = this.shopRoom!.toJson();
    }
    if (this.shopServices != null) {
      data['shopServices'] = this.shopServices!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetail {
  String? mobile;
  String? firstName;

  UserDetail({this.mobile, this.firstName});

  UserDetail.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
    firstName = json['first_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['mobile'] = this.mobile;
    data['first_name'] = this.firstName;
    return data;
  }
}
