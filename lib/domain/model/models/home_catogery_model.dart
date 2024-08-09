
class HomeCatogeryModel {
  int id;
  String name;
  HomeCategoryOptionModel options;

  HomeCatogeryModel({
    required this.id,
    required this.name,
    required this.options,
  });

  factory HomeCatogeryModel.fromJson(Map<String, dynamic> json) => HomeCatogeryModel(
    id: json["id"],
    name: json["name"]??'',
    options: HomeCategoryOptionModel.fromJson(json["options"]),
  );


}



class HomeCategoryOptionModel {
  bool roomsNo;
  bool bathroomsNo;
  bool floorsNo;
  bool receptionsNo;
  bool floor;
  bool apartmentsNo;
  bool direction;
  bool streetWidth;
  bool storesNo;
  bool buildingAge;
  bool kitchensNo;
  bool feminine;


  bool annex;
  bool carEntrance;
  bool elevator;
  bool  airConditioners;
  bool waterAvailability;
  bool electricityAvailability;
  bool swimmingPool;
  bool  footballField;
  bool  volleyballCourt;
  bool  amusementPark;
  bool familySection;



  HomeCategoryOptionModel({
    required this.roomsNo,
    required this.bathroomsNo,
    required this.floorsNo,
    required this.receptionsNo,
    required this.floor,
    required this.apartmentsNo,
    required this.direction,
    required this.streetWidth,
    required this.storesNo,
    required this.buildingAge,
    required this.kitchensNo,
    required this.feminine,
    required this. annex,
    required this. carEntrance,
    required this. elevator,
    required this.  airConditioners,
    required this. waterAvailability,
    required this. electricityAvailability,
    required this. swimmingPool,
    required this.  footballField,
    required this.  volleyballCourt,
    required this.  amusementPark,
    required this. familySection,
  });

  factory HomeCategoryOptionModel.fromJson(Map<String, dynamic> json) => HomeCategoryOptionModel(
    roomsNo: json["rooms_no"]??false,
    bathroomsNo: json["bathrooms_no"]??false,
    floorsNo: json["floors_no"]??false,
    receptionsNo: json["receptions_no"]??false,
    floor: json["floor"]??false,
    apartmentsNo: json["apartments_no"]??false,
    direction: json["direction"]??false,
    streetWidth: json["street_width"]??false,
    storesNo: json["stores_no"]??false,
    buildingAge: json["building_age"]??false,
    kitchensNo: json["kitchens_no"]??false,
    feminine: json["feminine"]??false,
    annex: json["annex"]??false,
    carEntrance: json["car_entrance"]??false,
    elevator: json["elevator"]??false,
    airConditioners: json["air_conditioners"]??false,
    waterAvailability: json["water_availability"]??false,
    electricityAvailability: json["electricity_availability"]??false,
    swimmingPool: json["swimming_pool"]??false,
    footballField: json["football_field"]??false,
    volleyballCourt: json["volleyball_court"]??false,
    amusementPark: json["amusement_park"]??false,
    familySection: json["family_section"]??false,

  );

  // Map<String, dynamic> toJson() => {
  //   "rooms_no": roomsNo,
  //   "bathrooms_no": bathroomsNo,
  //   // "floors_no": floorsNo,
  //   "receptions_no": receptionsNo,
  //   "floor": floor,
  //   "apartments_no": apartmentsNo,
  //   "direction": direction,
  //   "street_width": streetWidth,
  //   "stores_no": storesNo,
  //   "building_age": buildingAge,
  //   "kitchens_no": kitchensNo,
  //   "feminine": feminine,
  // };
}