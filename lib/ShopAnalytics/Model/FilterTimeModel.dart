class FilterTimeModel {
  String? name;
  String? from;
  String? to;

  FilterTimeModel({this.name, this.from, this.to});

  FilterTimeModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    from = json['from'];
    to = json['to'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['from'] = this.from;
    data['to'] = this.to;
    return data;
  }
}
