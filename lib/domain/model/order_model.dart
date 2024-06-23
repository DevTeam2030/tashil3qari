
import 'package:tashil_agary/app/enums.dart';
import 'package:tashil_agary/app/utils.dart';

class CalenderAppointmentModel {
  CalenderAppointmentModel({
    required this.orderId,
    required this.orderDate,
    required this.orderTime,
    required this.storeId,
    required this.store,
    required this.image,
    required this.storeAddress,

    required this.services,
  });

  int orderId;
  DateTime orderDate;
  String orderTime;
  String storeAddress;
  String storeId;
  String store;
  String image;
  List<AppointmentService> services;
  factory CalenderAppointmentModel.fromJson(Map<String, dynamic> json) => CalenderAppointmentModel(
    orderId: json["order_id"],
    orderDate: DateTime.parse(json["order_date"]),
    orderTime: json["order_time"].toString(),
    storeId: json["store_id"],
    store: json["store"]??'',
    storeAddress: json["store_address"]??'',

    image: json["image"]??'',

    services: List<AppointmentService>.from(json["services"].map((x) => AppointmentService.fromJson(x))),
  );


}
class AppointmentModel {
  AppointmentModel({
    required this.orderId,
    required this.total,
    required this.status,
    required this.orderDate,
    required this.orderTime,
    required this.storeId,
    required this.store,

    required this.image,
   required this.notes,
    required this.services,
  });

  int orderId;
  String total;
  AppointmentStatus status;
  DateTime orderDate;
  String orderTime;
  String storeId;
  String store;

  String image;
  String notes;
  List<AppointmentService> services;

  factory AppointmentModel.fromJson(Map<String, dynamic> json) => AppointmentModel(
    orderId: json["order_id"],
    total: json["total"]??0,
    status: Utils.appointmentStatus(status:json["status"]??''),
    orderDate: DateTime.parse(json["order_date"]),
    orderTime: json["order_time"].toString(),
    storeId: json["store_id"],
    store: json["store"]??'',

    image: json["image"]??'',
    notes: json["notes"]??'',
    services: List<AppointmentService>.from(json["services"].map((x) => AppointmentService.fromJson(x))),
  );


}




class AppointmentService {
  AppointmentService({
    required this.name,
    required this.id,
    required this.employeeId,
    required this.employee,
    required this.isChecked,
  });

  String name;
  int id;
  String employeeId;
  String employee;
  bool isChecked;
  factory AppointmentService.fromJson(Map<String, dynamic> json) => AppointmentService(
    name: json["name"]??'',
    id: json["id"],
    isChecked: false,
    employeeId: json["employee_id"]==null||json["employee_id"].toString().isEmpty?"0":json["employee_id"].toString(),
    employee: json["employee"]??'',
  );


}


