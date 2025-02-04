class CSSModel {
  String? name;
  String? description;
  String? shopId;
  String? serviceId;
  int? time;
  double? charge;
  int? strikeThroughCharge;
  String? gender;
  List<String>? shopRoomIds;
  String? image;

  CSSModel(
      {this.name,
      this.description,
      this.shopId,
      this.serviceId,
      this.time,
      this.charge,
      this.strikeThroughCharge,
      this.gender,
      this.image,
      this.shopRoomIds});

  CSSModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    shopId = json['shop_id'];
    serviceId = json['service_id'];
    time = json['time'];
    charge = json['charge'];
    strikeThroughCharge = json['strike_through_charge'];
    gender = json['gender'];
    shopRoomIds = json['shop_room_ids'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['shop_id'] = this.shopId;
    data['service_id'] = this.serviceId;
    data['time'] = this.time;
    data['charge'] = this.charge;
    data['strike_through_charge'] = this.strikeThroughCharge;
    data['gender'] = this.gender;
    data['shop_room_ids'] = this.shopRoomIds;
    return data;
  }
}
