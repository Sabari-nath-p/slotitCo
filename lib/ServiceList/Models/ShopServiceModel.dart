class ShopServiceModel {
  String? id;
  String? shopId;
  String? serviceId;
  String? name;
  String? description;
  String? image;
  String? charge;
  String? strikeThroughCharge;
  int? time;
  String? gender;
  Service? service;

  ShopServiceModel(
      {this.id,
      this.shopId,
      this.serviceId,
      this.name,
      this.description,
      this.image,
      this.charge,
      this.strikeThroughCharge,
      this.time,
      this.gender,
      this.service});

  ShopServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shopId = json['shop_id'];
    serviceId = json['service_id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    charge = json['charge'];
    strikeThroughCharge = json['strike_through_charge'];
    time = json['time'];
    gender = json['gender'];
    service =
        json['service'] != null ? new Service.fromJson(json['service']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shop_id'] = this.shopId;
    data['service_id'] = this.serviceId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['charge'] = this.charge;
    data['strike_through_charge'] = this.strikeThroughCharge;
    data['time'] = this.time;
    data['gender'] = this.gender;
    if (this.service != null) {
      data['service'] = this.service!.toJson();
    }
    return data;
  }
}

class Service {
  String? id;
  String? name;
  String? description;
  String? image;

  Service({this.id, this.name, this.description, this.image});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    return data;
  }
}
