


class OptionsModel {
  String name;
  List<OneOptionModel> options;
  OneOptionModel? selectedOption;
  OptionsModel({
    required this.name,
    required this.options,
    required this.selectedOption,
  });

  factory OptionsModel.fromJson(Map<String, dynamic> json) => OptionsModel(
    name: json["name"],
    options: List<OneOptionModel>.from(json["value"].map((x) => OneOptionModel.fromJson(x))),
    selectedOption: null,
  );


}

class OneOptionModel {
  int id;
  String name;

  OneOptionModel({
    required this.id,
    required this.name,
  });

  factory OneOptionModel.fromJson(Map<String, dynamic> json) => OneOptionModel(
    id: json["id"],
    name: json["name"]??'',
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
