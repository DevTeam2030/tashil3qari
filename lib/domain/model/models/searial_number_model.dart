
class SerialNumberModel {
  int id;
  String serialNumber;
  bool booked;

  SerialNumberModel({
    required this.id,
    required this.serialNumber,
    required this.booked,
  });

  factory SerialNumberModel.fromJson(Map<String, dynamic> json) => SerialNumberModel(
    id: json["id"],
    serialNumber: json["serial_number"].toString(),
    booked: json["booked"]??false,
  );

}


class NationalityModel {
  int id;
  String name;

  NationalityModel({
    required this.id,
    required this.name
  });

  factory NationalityModel.fromJson(Map<String, dynamic> json) => NationalityModel(
    id: json["id"],
    name: json["name"].toString(),

  );

}
