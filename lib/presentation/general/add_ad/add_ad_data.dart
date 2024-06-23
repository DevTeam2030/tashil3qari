part of'add_ad_imports.dart';


class AddAdtData {

  bool forSale=true;

  final formKey = GlobalKey<FormState>();
  List<CurrencyModel>currencies =[];
  late CurrencyModel selectedCurrency;
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController spaceController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();

  ValueNotifier<int> floor = ValueNotifier<int>(0);
  ValueNotifier<int> bedrooms = ValueNotifier<int>(0);
  ValueNotifier<int> bathrooms = ValueNotifier<int>(0);
  ValueNotifier<int> kitchen = ValueNotifier<int>(0);
late  ValueNotifier<FinishingTypesModel> finishing ;
late  ValueNotifier<HomeCatogeryModel> category ;
  ValueNotifier<List<XFile>> adImages = ValueNotifier<List<XFile>>([]);
  ValueNotifier<XFile?> video = ValueNotifier<XFile?>(null);

  List<CountryModel>selectedCountries =[];
  List<CityCountryModel>selectedCities =[];
  LatLng adLocation= LatLng(0,0);
  // TextEditingController searchController = TextEditingController();
  // ValueNotifier<String?>selectedFilter=ValueNotifier<String?>(null);
  // List<String>filters=['الكل','شقق للبيع','شقق للايجار','اراضى للبيع','فيلا للبيع','فيلا لليجار'];


  addPropertyWithLicense({required String license,required BuildContext context}){
    AddPropertyModel model= _getAddPropertyModel(published: 1);
    context.read<AddPropertyProvider>().addPropertyWithLicense(context: context, model: model, license: license);

  }

  addPropertyAndExtractLicense({required BuildContext context}){
    AddPropertyModel model= _getAddPropertyModel(published: 1);
    context.read<AddPropertyProvider>().addPropertyAndExtractLicense(context: context, model: model, );

  }
  addPropertyAndAddConsultant({required int consultantId,required BuildContext context}){
    AddPropertyModel model= _getAddPropertyModel(published: 1);

    context.read<AddPropertyProvider>().addPropertyAndAddConsultant(context: context, model: model,consultantId: consultantId);

  }

  saveWithoutPublish({required BuildContext context}){
    AddPropertyModel model= _getAddPropertyModel(published: 0);
    context.read<AddPropertyProvider>().saveWithoutPublish(context: context, model: model,);

  }
  AddPropertyModel _getAddPropertyModel({required int published})=>AddPropertyModel(
    video: video.value==null?null:File(video.value!.path),
    published: published,
    categoryId: category.value.id,
    cityId: selectedCities.first.id,
    countryId: selectedCountries.first.id,
    descriptionAr: detailsController.text,
    descriptionEn: detailsController.text,
    finishingTypeId: finishing.value.id,
    floor: floor.value,
    forSale: forSale,
    image: File(adImages.value.first.path),
    kitchensNo: kitchen.value,
    latitude: adLocation.latitude,
    longitude: adLocation.longitude,
    price: double.parse(priceController.text),
    propertySize:spaceController.text.isEmpty?0: double.tryParse(spaceController.text)??0,
    titleAr: titleController.text,
    titleEn: titleController.text,
    bathroomsNo: bathrooms.value,
    roomsNo: bedrooms.value,
    width: widthController.text.isEmpty?0:double.tryParse(widthController.text)??0,
    length: lengthController.text.isEmpty?0:double.tryParse(lengthController.text)??0,
    gallery: adImages.value.map((e) => File(e.path)).toList(),
    currencyId: selectedCurrency.id,
  );







}

