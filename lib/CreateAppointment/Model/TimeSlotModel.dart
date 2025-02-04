class TimeSlotModel {
  String? id;
  String? timeFrom;
  bool? isAvailable;

  TimeSlotModel({this.id, this.timeFrom, this.isAvailable});

  TimeSlotModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    timeFrom = json['time_from'];
    isAvailable = json['is_available'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['time_from'] = this.timeFrom;
    data['is_available'] = this.isAvailable;
    return data;
  }
}
