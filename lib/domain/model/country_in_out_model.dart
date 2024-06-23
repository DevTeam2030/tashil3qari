
class CountryInOutModel {
  CountryInOutModel({
    // required this.geopluginRequest,
    // required this.geopluginStatus,
    // required this.geopluginDelay,
    // required this.geopluginCredit,
    // required this.geopluginCity,
    // required this.geopluginRegion,
    // required this.geopluginRegionCode,
    // required this.geopluginRegionName,
    // required this.geopluginAreaCode,
    // required this.geopluginDmaCode,
    // required this.geopluginCountryCode,
    // required this.geopluginCountryName,
    // required this.geopluginInEu,
    // required this.geopluginEuVaTrate,
    // required this.geopluginContinentCode,
    // required this.geopluginContinentName,
    required this.geopluginLatitude,
    required this.geopluginLongitude,
    // required this.geopluginLocationAccuracyRadius,
    // required this.geopluginTimezone,
    // required this.geopluginCurrencyCode,
    // required this.geopluginCurrencySymbol,
    // required this.geopluginCurrencySymbolUtf8,
    // required this.geopluginCurrencyConverter,
  });

  // String geopluginRequest;
  // int geopluginStatus;
  // String geopluginDelay;
  // String geopluginCredit;
  // String geopluginCity;
  // String geopluginRegion;
  // String geopluginRegionCode;
  // String geopluginRegionName;
  // String geopluginAreaCode;
  // String geopluginDmaCode;
  // String geopluginCountryCode;
  // String geopluginCountryName;
  // int geopluginInEu;
  // bool geopluginEuVaTrate;
  // String geopluginContinentCode;
  // String geopluginContinentName;
  String geopluginLatitude;
  String geopluginLongitude;
  // String geopluginLocationAccuracyRadius;
  // String geopluginTimezone;
  // String geopluginCurrencyCode;
  // String geopluginCurrencySymbol;
  // String geopluginCurrencySymbolUtf8;
  // double geopluginCurrencyConverter;

  factory CountryInOutModel.fromJson(Map<String, dynamic> json) => CountryInOutModel(
    // geopluginRequest: json["geoplugin_request"],
    // geopluginStatus: json["geoplugin_status"],
    // geopluginDelay: json["geoplugin_delay"],
    // geopluginCredit: json["geoplugin_credit"],
    // geopluginCity: json["geoplugin_city"],
    // geopluginRegion: json["geoplugin_region"],
    // geopluginRegionCode: json["geoplugin_regionCode"],
    // geopluginRegionName: json["geoplugin_regionName"],
    // geopluginAreaCode: json["geoplugin_areaCode"],
    // geopluginDmaCode: json["geoplugin_dmaCode"],
    // geopluginCountryCode: json["geoplugin_countryCode"],
    // geopluginCountryName: json["geoplugin_countryName"],
    // geopluginInEu: json["geoplugin_inEU"],
    // geopluginEuVaTrate: json["geoplugin_euVATrate"],
    // geopluginContinentCode: json["geoplugin_continentCode"],
    // geopluginContinentName: json["geoplugin_continentName"],
    geopluginLatitude: json["geoplugin_latitude"],
    geopluginLongitude: json["geoplugin_longitude"],
    // geopluginLocationAccuracyRadius: json["geoplugin_locationAccuracyRadius"],
    // geopluginTimezone: json["geoplugin_timezone"],
    // geopluginCurrencyCode: json["geoplugin_currencyCode"],
    // geopluginCurrencySymbol: json["geoplugin_currencySymbol"],
    // geopluginCurrencySymbolUtf8: json["geoplugin_currencySymbol_UTF8"],
    // geopluginCurrencyConverter: json["geoplugin_currencyConverter"]?.toDouble(),
  );

  // Map<String, dynamic> toJson() => {
  //   "geoplugin_request": geopluginRequest,
  //   "geoplugin_status": geopluginStatus,
  //   "geoplugin_delay": geopluginDelay,
  //   "geoplugin_credit": geopluginCredit,
  //   "geoplugin_city": geopluginCity,
  //   "geoplugin_region": geopluginRegion,
  //   "geoplugin_regionCode": geopluginRegionCode,
  //   "geoplugin_regionName": geopluginRegionName,
  //   "geoplugin_areaCode": geopluginAreaCode,
  //   "geoplugin_dmaCode": geopluginDmaCode,
  //   "geoplugin_countryCode": geopluginCountryCode,
  //   "geoplugin_countryName": geopluginCountryName,
  //   "geoplugin_inEU": geopluginInEu,
  //   "geoplugin_euVATrate": geopluginEuVaTrate,
  //   "geoplugin_continentCode": geopluginContinentCode,
  //   "geoplugin_continentName": geopluginContinentName,
  //   "geoplugin_latitude": geopluginLatitude,
  //   "geoplugin_longitude": geopluginLongitude,
  //   "geoplugin_locationAccuracyRadius": geopluginLocationAccuracyRadius,
  //   "geoplugin_timezone": geopluginTimezone,
  //   "geoplugin_currencyCode": geopluginCurrencyCode,
  //   "geoplugin_currencySymbol": geopluginCurrencySymbol,
  //   "geoplugin_currencySymbol_UTF8": geopluginCurrencySymbolUtf8,
  //   "geoplugin_currencyConverter": geopluginCurrencyConverter,
  // };
}
