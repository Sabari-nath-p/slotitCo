class RoomAnalytics {
  String? shopRoomName;
  String? totalAmount;
  String? totalServicesCount;

  RoomAnalytics({this.shopRoomName, this.totalAmount, this.totalServicesCount});

  RoomAnalytics.fromJson(Map<String, dynamic> json) {
    shopRoomName = json['shop_room_name'];
    totalAmount = json['total_amount'].toString();
    totalServicesCount =
        json['total_services_count'].toString().replaceAll("null", "0");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_room_name'] = this.shopRoomName;
    data['total_amount'] = this.totalAmount;
    data['total_services_count'] = this.totalServicesCount;
    return data;
  }
}
