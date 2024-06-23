

class PopularCatModel {
  PopularCatModel({
    required this.image,
    required this.name,
  });

  String image;
  String name;

  Map<String, dynamic> toJson() => {
    "image": image,
    "name": name,
  };

}
