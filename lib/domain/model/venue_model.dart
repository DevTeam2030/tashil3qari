import 'package:tashil_agary/domain/model/catogery_model.dart';
import 'package:tashil_agary/domain/model/employee_model.dart';
import 'package:tashil_agary/domain/model/venue_service_model.dart';
import 'package:tashil_agary/domain/model/reviews_venue_model.dart';

class VenueModel {
  VenueModel({
  required this.id,
  required this.name,
  required this.address,
  required this.type,
  required this.mainAppointment,
  required this.about,
  required this.image,
  required this.reviewCount,
  required this.review,
  required this.services,
  required this.schedules,
  required this.gallery,
  required this.employees,
  required this.reviews,
  required this.wishlist,
  required this.latitude,
  required this.longitude,
  required this.distance,
  required this.confirmation,
  required this.category,
  required this.popularServices,
  required this.categories,
  required this.orderBefore,
  required this.attendance,
  required this.cancellationPolicy,
  });

  int id;
  String name;
  String address;
  String type;
  String mainAppointment;
  String about;
  int reviewCount;
  int review;
  bool wishlist;
  bool orderBefore;
  String latitude;
  String longitude;
  String distance;
  String confirmation;
  String category;
  List<VenueServiceModel> services;
  Schedules schedules;
  List<String> gallery;
  List<String> attendance;
  List<String> cancellationPolicy;
  List<EmployeeModel> employees;
  List<CategoryModel> categories;
  List<VenueServiceModel> popularServices;
  ReviewsVenueModel reviews;
  String image;




  factory VenueModel.fromJson(Map<String, dynamic> json) => VenueModel(
  id: json["id"],
  name: json["name"]??'',
  address: json["address"]??'',
  type: json["type"]??'',
    image: json["image"]??'',
  mainAppointment: json["main_appointment"]??'',
  about: json["about"]??'',
    latitude: json["latitude"]??'0',
    longitude: json["longitude"]??'0',
    distance: json["distance"].toString(),
    confirmation: json["confirmation"]??'',
    category: json["category"]??'',
  reviewCount: json["review_count"]??0,
  review: json["review"]??0,
    wishlist: json["wishlist"]??false,
    orderBefore: json["order_before"]??false,
  services: List<VenueServiceModel>.from(json["services"].map((x) => VenueServiceModel.fromJson(x))),
    categories: List<CategoryModel>.from(json["categories"].map((x) => CategoryModel.fromJson(x))),
  schedules: Schedules.fromJson(json["schedules"]),
  gallery: List<String>.from(json["gallery"].map((x) => x)),
    attendance: List<String>.from(json["attendance"].map((x) => x)),
    cancellationPolicy: List<String>.from(json["cancellation_policy"].map((x) => x)),
  employees: List<EmployeeModel>.from(json["employees"].map((x) => EmployeeModel.fromJson(x))),
  popularServices:json["featured_services"]==null?[]: List<VenueServiceModel>.from(json["featured_services"].map((x) => VenueServiceModel.fromJson(x))),
  reviews: ReviewsVenueModel.fromJson(json["reviews"]),
  );


  }





  class Schedules {
  Schedules({
  required this.mondayFrom,
  required this.mondayTo,
  required this.tuesdayFrom,
  required this.tuesdayTo,
  required this.wednesdayFrom,
  required this.wednesdayTo,
  required this.thursdayFrom,
  required this.thursdayTo,
 required this.saturdayFrom,
 required this.saturdayTo,
  required this.sundayFrom,
  required this.sundayTo,
  required this.fridayFrom,
  required this.fridayTo,
  });

  String mondayFrom;
  String mondayTo;
  String tuesdayFrom;
  String tuesdayTo;
  String wednesdayFrom;
  String wednesdayTo;
  String thursdayFrom;
  String thursdayTo;
  String fridayFrom;
  String fridayTo;
  String saturdayFrom;
  String saturdayTo;
  String sundayFrom;
  String sundayTo;

  factory Schedules.fromJson(Map<String, dynamic> json) => Schedules(
  mondayFrom: json["monday_from"]??'',
  mondayTo: json["monday_to"]??'',
  tuesdayFrom: json["tuesday_from"]??'',
  tuesdayTo: json["tuesday_to"]??'',
  wednesdayFrom: json["wednesday_from"]??'',
  wednesdayTo: json["wednesday_to"]??'',
  thursdayFrom: json["thursday_from"]??'',
  thursdayTo: json["thursday_to"]??'',
    fridayFrom: json["friday_from"]??'',
    fridayTo: json["friday_to"]??'',
  saturdayFrom: json["saturday_from"]??'',
  saturdayTo: json["saturday_to"]??'',
  sundayFrom: json["sunday_from"]??'',
  sundayTo: json["sunday_to"]??'',
  );

  Map<String, dynamic> toJson() => {
  "monday_from": mondayFrom,
  "monday_to": mondayTo,
  "tuesday_from": tuesdayFrom,
  "tuesday_to": tuesdayTo,
  "wednesday_from": wednesdayFrom,
  "wednesday_to": wednesdayTo,
  "thursday_from": thursdayFrom,
  "thursday_to": thursdayTo,
  "saturday_from": saturdayFrom,
  "saturday_to": saturdayTo,
  "sunday_from": sundayFrom,
  "sunday_to": sundayTo,
  };
  }




