
  class EmployeeModel {
    EmployeeModel({
  required this.id,
  required this.name,
  required this.jobTitle,
  required this.image,
  });

  int id;
  String name;
  String jobTitle;
  String image;

  factory EmployeeModel.fromJson(Map<String, dynamic> json) => EmployeeModel(
  id: json["id"],
  name: json["name"]??'',
  jobTitle: json["job_title"]??'',
  image: json["image"]??'',
  );

  }




