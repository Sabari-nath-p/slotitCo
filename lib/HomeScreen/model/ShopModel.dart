class ShopModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? whatsappIdentifier;
  Address? address;
  String? contactEmail;
  String? contactPhone;

  ShopModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.whatsappIdentifier,
      this.address,
      this.contactEmail,
      this.contactPhone});

  ShopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    whatsappIdentifier = json['whatsapp_identifier'];
    address =
        json['address'] != null ? new Address.fromJson(json['address']) : null;
    contactEmail = json['contact_email'];
    contactPhone = json['contact_phone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['whatsapp_identifier'] = this.whatsappIdentifier;
    if (this.address != null) {
      data['address'] = this.address!.toJson();
    }
    data['contact_email'] = this.contactEmail;
    data['contact_phone'] = this.contactPhone;
    return data;
  }
}

class Address {
  String? address;

  Address({this.address});

  Address.fromJson(Map<String, dynamic> json) {
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['address'] = this.address;
    return data;
  }
}
