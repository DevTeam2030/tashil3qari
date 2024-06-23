


class HomeProduct {
  int id;
  String name;
  String des;
  String image;
  double price;
  double salePrice;
  bool isfavourite;


  HomeProduct({
    required this.id,
    required this.name,
    required this.des,
    required this.image,
    required this.price,
    required this.salePrice,
    required this.isfavourite,

  });

  factory HomeProduct.fromJson(Map<String, dynamic> json) => HomeProduct(
    id: json["id"],
    name: json["name"]??'',
    des: json["des"]??'',
    image: json["image"]??'',
    price: double.parse((json["price"]??0).toString()),
    salePrice: double.parse((json["sale_price"]??0).toString()),
    isfavourite: json["isfavourite"]??false,

  );

  // Map<String, dynamic> toJson() => {
  //   "id": id,
  //   "name": name,
  //   "des": des,
  //   "image": image,
  //   "price": price,
  //   "sale_price": salePrice,
  //   "isfavourite": isfavourite,
  // };
}




