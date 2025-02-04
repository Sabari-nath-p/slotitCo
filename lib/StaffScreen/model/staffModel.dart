class StaffModel {
  String? id;
  String? shopId;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  String? phone;
  String? password;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  List<ShopRooms>? shopRooms;

  StaffModel(
      {this.id,
      this.shopId,
      this.firstName,
      this.lastName,
      this.userType,
      this.email,
      this.phone,
      this.password,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.shopRooms});

  StaffModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['shopRooms'] != null) {
      shopRooms = <ShopRooms>[];
      json['shopRooms'].forEach((v) {
        shopRooms!.add(new ShopRooms.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['user_type'] = this.userType;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.shopRooms != null) {
      data['shopRooms'] = this.shopRooms!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ShopRooms {
  String? id;
  String? shopId;
  String? name;
  String? description;
  String? image;

  ShopRooms({this.id, this.shopId, this.name, this.description, this.image});

  ShopRooms.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
