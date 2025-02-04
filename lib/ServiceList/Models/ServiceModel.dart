class ServiceModel {
  String? name;
  String? description;
  String? image;
  String? id;

  ServiceModel({this.name, this.description, this.image, this.id});

  ServiceModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    image = json['image'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['id'] = this.id;
    return data;
  }
}
