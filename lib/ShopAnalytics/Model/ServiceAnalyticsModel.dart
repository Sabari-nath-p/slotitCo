class ServiceAnalyticsModel {
  String? shopServiceName;
  int? bookingsCount;

  ServiceAnalyticsModel({this.shopServiceName, this.bookingsCount});

  ServiceAnalyticsModel.fromJson(Map<String, dynamic> json) {
    shopServiceName = json['shop_service_name'];
    bookingsCount = json['bookings_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['shop_service_name'] = this.shopServiceName;
    data['bookings_count'] = this.bookingsCount;
    return data;
  }
}
