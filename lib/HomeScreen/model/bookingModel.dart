class BookingModel {
  String? id;
  String? shopRoomId;
  List<String>? shopServiceIds;
  UserDetail? userDetail;
  String? note;
  bool? isOnline;
  String? timeFrom;
  String? timeTo;
  String? date;
  String? createdAt;
  String? updatedAt;
  ShopRoom? shopRoom;

  BookingModel(
      {this.id,
      this.shopRoomId,
      this.shopServiceIds,
      this.userDetail,
      this.note,
      this.isOnline,
      this.timeFrom,
      this.timeTo,
      this.date,
      this.createdAt,
      this.updatedAt,
      this.shopRoom});

  BookingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopRoomId = json['shop_room_id'];
    shopServiceIds = json['shop_service_ids'].cast<String>();
    userDetail = json['userDetail'] != null
        ? new UserDetail.fromJson(json['userDetail'])
        : null;
    note = json['note'];
    isOnline = json['is_online'];
    timeFrom = json['time_from'];
    timeTo = json['time_to'];
    date = json['date'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    shopRoom = json['shopRoom'] != null
        ? new ShopRoom.fromJson(json['shopRoom'])
        : null;
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
    data['is_online'] = this.isOnline;
    data['time_from'] = this.timeFrom;
    data['time_to'] = this.timeTo;
    data['date'] = this.date;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    if (this.shopRoom != null) {
      data['shopRoom'] = this.shopRoom!.toJson();
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

class ShopRoom {
  String? id;
  String? shopId;
  String? name;
  String? description;
  String? image;
  String? createdAt;
  String? updatedAt;

  ShopRoom(
      {this.id,
      this.shopId,
      this.name,
      this.description,
      this.image,
      this.createdAt,
      this.updatedAt});

  ShopRoom.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
