class UserModel {
  String? id;
  String? shopId;
  String? firstName;
  String? lastName;
  String? userType;
  String? email;
  String? phone;
  String? password;
  bool? isActive;

  UserModel(
      {this.id,
      this.shopId,
      this.firstName,
      this.lastName,
      this.userType,
      this.email,
      this.phone,
      this.password,
      this.isActive});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    userType = json['user_type'];
    email = json['email'];
    phone = json['phone'];
    password = json['password'];
    isActive = json['is_active'];
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
    return data;
  }
}
