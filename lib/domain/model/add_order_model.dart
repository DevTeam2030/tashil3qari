class AddOrderModel {
  AddOrderModel({
    required this.storeId,
    required this.addressId,
    required this.subtotal,
    required this.total,
    required this.orderDate,
    required this.orderTime,
    required this.services,
  });

  int storeId;
  int addressId;
  int subtotal;
  int total;
  DateTime orderDate;
  String orderTime;
  List<OrderServiceModel> services;

  factory AddOrderModel.fromJson(Map<String, dynamic> json) => AddOrderModel(
    storeId: json["store_id"],
    addressId: json["address_id"],
    subtotal: json["subtotal"],
    total: json["total"],
    orderDate: DateTime.parse(json["order_date"]),
    orderTime: json["order_time"],
    services: List<OrderServiceModel>.from(json["services"].map((x) => OrderServiceModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "store_id": storeId,
    "address_id": addressId,
    "subtotal": subtotal,
    "total": total,
    "order_date": "${orderDate.year.toString().padLeft(4, '0')}-${orderDate.month.toString().padLeft(2, '0')}-${orderDate.day.toString().padLeft(2, '0')}",
    "order_time": orderTime,
    "services": List<dynamic>.from(services.map((x) => x.toJson())),
  };
}

class OrderServiceModel {
  OrderServiceModel({
    required this.service,
    required this.employeeId,
    required this.startTime,
    this.optionId,
  });

  int service;
  int employeeId;
  String startTime;
  int? optionId;

  factory OrderServiceModel.fromJson(Map<String, dynamic> json) => OrderServiceModel(
    service: json["service"],
    employeeId: json["employee_id"],
    startTime: json["start_time"],
    optionId: json["option_id"],
  );

  Map<String, dynamic> toJson() => {
    "service": service,
    "employee_id": employeeId,
    "start_time": startTime,
    "option_id": optionId,
  };
}
