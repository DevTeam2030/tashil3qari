class PromoCodeModel {
  PromoCodeModel({
    required this.promoCodeId,
    required this.discountPercentage,


  });

  int promoCodeId;
  double discountPercentage;



  factory PromoCodeModel.fromJson(Map<String, dynamic> json) => PromoCodeModel(
    promoCodeId: json["promo_code_id"]??0,
    discountPercentage: json["discount_percentage"]!=null?double.parse(json["discount_percentage"].toString()):0,



  );


}
