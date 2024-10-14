part of'edit_ad_imports.dart';


class EditAdData {
 late UserAdsModel userAd;
  final formKey = GlobalKey<FormState>();
 bool forSale=true;
 bool monthly=true;  /// if forSale == false
  TextEditingController priceController = TextEditingController();
 TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();
  TextEditingController spaceController = TextEditingController();
  TextEditingController lengthController = TextEditingController();
  TextEditingController widthController = TextEditingController();
  TextEditingController licenseAdController = TextEditingController();

  ValueNotifier<int> floor = ValueNotifier<int>(0);
  ValueNotifier<int> bedrooms = ValueNotifier<int>(0);
  ValueNotifier<int> bathrooms = ValueNotifier<int>(0);
  ValueNotifier<int> kitchen = ValueNotifier<int>(0);

 TextEditingController streetWidthController = TextEditingController();
 ValueNotifier<int> receptionsNo = ValueNotifier<int>(0);
 ValueNotifier<int> apartmentsNo = ValueNotifier<int>(0);
 ValueNotifier<int> storesNo = ValueNotifier<int>(0);
 ValueNotifier<int> buildingAge = ValueNotifier<int>(0);
 ValueNotifier<int> floorsNo = ValueNotifier<int>(0);
 ValueNotifier<bool> feminine = ValueNotifier<bool>(false);


 ValueNotifier<bool> annex = ValueNotifier<bool>(false);
 ValueNotifier<bool> carEntrance = ValueNotifier<bool>(false);
 ValueNotifier<bool> elevator = ValueNotifier<bool>(false);
 ValueNotifier<bool> airConditioners = ValueNotifier<bool>(false);
 ValueNotifier<bool> waterAvailability = ValueNotifier<bool>(false);
 ValueNotifier<bool> electricityAvailability = ValueNotifier<bool>(false);
 ValueNotifier<bool> swimmingPool = ValueNotifier<bool>(false);
 ValueNotifier<bool> footballField = ValueNotifier<bool>(false);
 ValueNotifier<bool> volleyballCourt = ValueNotifier<bool>(false);
 ValueNotifier<bool> amusementPark = ValueNotifier<bool>(false);
 ValueNotifier<bool> familySection = ValueNotifier<bool>(false);


 ValueNotifier<List<String>> direction = ValueNotifier<List<String>>([Constants.directions.first]);


late  ValueNotifier<FinishingTypesModel> finishing ;
 late  ValueNotifier<HomeCatogeryModel> category ;
 late CurrencyModel selectedCurrency;
  ValueNotifier<List<XFile>> adImages = ValueNotifier<List<XFile>>([]);
 UserType userType=UserType.user;
 ValueNotifier<XFile?> video = ValueNotifier<XFile?>(null);


  EditAdData({required UserAdsModel ad}){
    userAd=ad;
    forSale=userAd.type=='sale';
    monthly=userAd.monthly;
    userType=Constants.userDataModel!.isUser?UserType.user:UserType.consultant;
    titleController.text=ad.propertyTitle;
    detailsController.text=ad.propertyDescription;
    priceController.text=ad.price;
    spaceController.text=ad.propertySize;
    lengthController.text=ad.length;
    widthController.text=ad.width;
    licenseAdController.text=ad.license;
    bedrooms.value=int.tryParse(ad.roomsNo)??0;
    kitchen.value=int.tryParse(ad.kitchensNo)??0;
    floor.value=int.tryParse(ad.floor)??0;
    floorsNo.value=int.tryParse(ad.floorsNo)??0;

    feminine.value=ad.feminine;
    annex.value=ad.annex;
    carEntrance.value=ad.carEntrance;
    elevator.value=ad.elevator;
    airConditioners.value=ad.airConditioners;
    waterAvailability.value=ad.waterAvailability;
    electricityAvailability.value=ad.electricityAvailability;
    swimmingPool.value=ad.swimmingPool;
    footballField.value=ad.footballField;
    volleyballCourt.value=ad.volleyballCourt;
    amusementPark.value=ad.amusementPark;
    familySection.value=ad.familySection;





    streetWidthController.text=ad.streetWidth;
    receptionsNo.value=int.tryParse(ad.receptionsNo)??0;
    apartmentsNo.value=int.tryParse(ad.apartmentsNo)??0;
    storesNo.value=int.tryParse(ad.storesNo)??0;
    buildingAge.value=int.tryParse(ad.buildingAge)??0;
    // direction.value=ad.direction.isEmpty?directions.first:ad.direction;




    direction.value.clear();
    for(var item in ad.direction){
      if(Constants.directions.contains(item)&&!direction.value.contains(item)){
        direction.value.add(item);
      }
    }
    if(direction.value.isEmpty){
      direction.value=[Constants.directions.first];
    }

    var c=Constants.settingModel.currencies.where((element) => element.id==(int.tryParse(userAd.currencyId)??0));
    selectedCurrency= c.isEmpty?Constants.settingModel.currencies.first:c.first;


    
    var data=Constants.settingModel.finishingTypes.where((element) => element.id==userAd.finishingTypeId);
    finishing= ValueNotifier<FinishingTypesModel>(data.isEmpty?Constants.settingModel.finishingTypes.first:data.first);

  var  categories=Constants.settingModel.categories.where((element) => element.id!=0);
    var data2=categories.where((element) => element.id==userAd.catId);
    category= ValueNotifier<HomeCatogeryModel>(data2.isEmpty?categories.first:data2.first);




    // detailsController.text='منزل للبيع في شارع الزنجاني عبد الوهاب بن ابراهيم ، حي مدائن الفهد ، جدة ، جدةشقة للبيع في شارع الزنجاني الفهد ، جدة ، جدةشقة للبيع في شارع الزنجاني...';
    // priceController.text='5500';
    // spaceController.text='250';
  }

 editProperty({required BuildContext context}){
   EditPropertyModel model= getModel();
   context.read<AddPropertyProvider>().editProperty(context: context, model: model, );

 }
 deleteVideo({required BuildContext context})async{
 bool isDeleted=await  context.read<AddPropertyProvider>().deleteVideo(context: context, propertyId: userAd.id);
   if(isDeleted) userAd.video='';

 }
 EditPropertyModel getModel()=> EditPropertyModel(
     video: video.value==null?null:File(video.value!.path),
   propertyId: userAd.id,
   forSale: forSale,
   monthly: monthly,
   titleAr: titleController.text,
   categoryId: category.value.id,
   descriptionAr: detailsController.text,
   descriptionEn: detailsController.text,

   image: adImages.value.isEmpty?null:File(adImages.value.first.path),
   price: double.parse(priceController.text),
   titleEn: titleController.text,
   gallery:adImages.value.isEmpty?[]: adImages.value.map((e) => File(e.path)).toList(),
   currencyId: selectedCurrency.id,
   license: licenseAdController.text,
   longitude: userAd.longitude,
   latitude: userAd.latitude,
   countryId: userAd.countryId,
   cityId: userAd.cityId,
   width: widthController.text.isEmpty?0:double.tryParse(widthController.text)??0,
   length: lengthController.text.isEmpty?0:double.tryParse(lengthController.text)??0,
   propertySize:spaceController.text.isEmpty?0: double.tryParse(spaceController.text)??0,


   bathroomsNo:!category.value.options.bathroomsNo?0: bathrooms.value,
   roomsNo: !category.value.options.roomsNo?0: bedrooms.value,
   kitchensNo: !category.value.options.kitchensNo?0: kitchen.value,
   finishingTypeId: finishing.value.id,
   floor: !category.value.options.floor?0: floor.value,
   apartmentsNo: !category.value.options.apartmentsNo?0: apartmentsNo.value,
   buildingAge:!category.value.options.buildingAge?0: buildingAge.value ,
   direction:!category.value.options.direction?[]: direction.value ,
   receptionsNo: !category.value.options.receptionsNo?0: receptionsNo.value,
   storesNo:!category.value.options.storesNo?0:  storesNo.value,
   floorsNo:!category.value.options.floorsNo?0:  floorsNo.value,
   feminine:!category.value.options.feminine?false:  feminine.value,
   streetWidth:!category.value.options.streetWidth?0: streetWidthController.text.isEmpty?0:double.tryParse(streetWidthController.text)??0,
   annex:!category.value.options.annex?false:  annex.value,
   carEntrance:!category.value.options.carEntrance?false:  carEntrance.value,
   elevator:!category.value.options.elevator?false:  elevator.value,
   airConditioners:!category.value.options.airConditioners?false:  airConditioners.value,
   waterAvailability:!category.value.options.waterAvailability?false:  waterAvailability.value,
   electricityAvailability:!category.value.options.electricityAvailability?false:  electricityAvailability.value,
   swimmingPool:!category.value.options.swimmingPool?false:  swimmingPool.value,
   footballField:!category.value.options.footballField?false:  footballField.value,
   volleyballCourt:!category.value.options.volleyballCourt?false:  volleyballCourt.value,
   amusementPark:!category.value.options.amusementPark?false:  amusementPark.value,
   familySection:!category.value.options.familySection?false:  familySection.value,

 );

  deleteImageFromAd({required BuildContext context,required GalleryModel image,required Function() onDelete}){
   var ctx=context;
    LoadingDialog().widgetAlertDialog(context:context,
        widget:  Center(
            child: Material(
              borderRadius: BorderRadius.circular(RadiusManager.r18),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal:PaddingManager.p10),
                height: .35.sh,
                width: .8.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const AppSizeBox(height: 8,),
                    CachedImage(
                      url: image.url,
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(10),
                      width: 100,height: 100,
                    ),
                    const AppSizeBox(height: 16,),
                    AppText(title:'deleteImageAlert'.tr(),
                      titleSize: FontSize.s16, titleAlign: TextAlign.center,
                      titleColor: ColorManager.text,
                      fontWeightType: FontWeightType.bold,
                      titleMaxLines: 2,),
                    const AppSizeBox(height: 8,),

                    SizedBox(
                      height: AppSize.s60.h,
                      child: Row(
                        children: [
                          const AppSizeBox(width: AppSize.s20),
                          Expanded(
                              flex: 1,
                              child: AlertButton(title: 'ok'.tr(),
                                width: .6.sw,
                                color: ColorManager.primary,
                                // borderColor: ColorManager.grey,
                                onClick: ()=>onDelete(),)),
                          const AppSizeBox(width: AppSize.s20),
                          Expanded(
                              flex: 1,
                              child: AlertButton(
                                  width: .6.sw,
                                  color: ColorManager.white,
                                  borderColor: ColorManager.grey,
                                  titleColor: ColorManager.primary,
                                  title: 'Cancel'.tr(),onClick:(){
                                  Navigator.pop(context);
                              })),
                          const AppSizeBox(width: AppSize.s20),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            )),);
  }
  addReason({required BuildContext context}){
    Navigator.pop(context);
    LoadingDialog().widgetAlertDialog(context:context,
        widget:  Center(
            child: Material(
              borderRadius: BorderRadius.circular(RadiusManager.r18),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal:PaddingManager.p10),
                height: .35.sh,
                width: .8.sw,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(ImageManager.alertSuccess,height: 140,fit: BoxFit.fill,),
                    const AppSizeBox(height: 16,),
                    AppText(title:'Your ad has been closed successfully'.tr(),
                      titleSize: FontSize.s22, titleAlign: TextAlign.center,
                      titleColor: ColorManager.text,
                      fontWeightType: FontWeightType.extraBold,
                      titleMaxLines: 2,),
                    const AppSizeBox(height: 8,),
                    AppText(title:'closeAdMessage'.tr(),
                      titleSize: FontSize.s12, titleAlign: TextAlign.center,
                      titleColor: ColorManager.text,
                      fontWeightType: FontWeightType.medium,
                      titleMaxLines: 3,),
                  ],
                ),
              ),
            )));
  }
}

