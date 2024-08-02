part of'widget_imports.dart';

class TypesFilter extends StatefulWidget {
 final   GlobalKey<FormState> formKey;
 late ValueNotifier<HomeCatogeryModel> selectedCategory;
final  TextEditingController lowestPriceController;
final  TextEditingController abovePriceController;
final  TextEditingController spaceController;

final  ValueNotifier<int> floor;
final  ValueNotifier<int> bedrooms;
final  ValueNotifier<int> bathrooms;
final  ValueNotifier<int> kitchen;
final  ValueNotifier<FinishingTypesModel> finishing;
final ValueNotifier<bool> open;

 final  TextEditingController streetWidthController;
 final  ValueNotifier<int> receptionsNo;
 final  ValueNotifier<int> apartmentsNo;
 final  ValueNotifier<int> storesNo;
 final  ValueNotifier<int> floorsNo;
 final  ValueNotifier<int> buildingAge;
 final  ValueNotifier<String> direction;

   TypesFilter({super.key,required this.formKey,required this.lowestPriceController,
     required this.streetWidthController,required this.receptionsNo,required this.apartmentsNo,required this.storesNo,required this.buildingAge,
 required this.abovePriceController,required this.spaceController,required this.floor,required this.bedrooms,required this.floorsNo,
   required this.bathrooms,required this.kitchen,required this.finishing,required this.selectedCategory,required this.open, required this.direction});

  @override
  State<TypesFilter> createState() => _TypesFilterState();
}

class _TypesFilterState extends State<TypesFilter> {



  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
              child: AppText(
                title: 'Category'.tr(),
                // title: 'Property type'.tr(),
                titleSize: FontSize.s14,
                titleAlign: TextAlign.start,
                titleColor: ColorManager.black,
                fontWeightType: FontWeightType.medium,
              ),
            ),
          ],
        ),
        const AppSizeBox(
          height: 8,
        ),
        ValueListenableBuilder(
          valueListenable: widget.open,
          builder: (context, value, child) => AnimatedContainer(
            duration:  const Duration(milliseconds: 500),
            // margin: EdgeInsets.only(top: 110),
            padding: const EdgeInsets.symmetric(
                vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
            width: 1.0.sw,
            // height: value ? 280 : 45,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r12),
              border: Border.all(color: ColorManager.grey, width: 1),
              color: ColorManager.textGrey,
              // boxShadow: Constants.kBoxShadow
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [


                InkWell(
                  onTap: () {
                    onSelected(value:widget.selectedCategory.value);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        title: widget.selectedCategory.value.name,
                        titleSize: FontSize.s14,
                        titleAlign: TextAlign.start,
                        titleHeight: 1.4,
                        titleMaxLines: 4,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.medium,
                      ),

                      Icon(value?Icons.keyboard_arrow_up_outlined:Icons.keyboard_arrow_down_outlined,
                        color: ColorManager.primary,size: AppSize.s25,)
                    ],
                  ),
                ),


                if (value)
                  Column(
                      children: Constants.settingModel.categories.where((element) =>  element!=widget.selectedCategory.value)
                          .map(
                            (e) =>
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: InkWell(
                                  onTap: () => onSelected(value: e),
                                child: Row(
                                  children: [
                                    AppText(
                                      title: e.name,
                                      titleSize: FontSize.s14,
                                      titleAlign: TextAlign.start,
                                      titleHeight: 1.4,
                                      titleMaxLines: 4,
                                      titleColor:
                                          ColorManager.black,
                                      fontWeightType: FontWeightType.medium,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList())


              ],
            ),
          ),
        ),


        ValueListenableBuilder(
          valueListenable: widget.open,
          builder: (context, value, child) =>
          widget.selectedCategory.value== Constants.settingModel.categories.first?const AppSizeBox(width: 0,):Column(
            children: [
              Form(
                key: widget.formKey,
                child: Column(
                  children: [
                    const AppSizeBox(height: AppSize.s14,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
                          child: AppText(
                            title: 'price'.tr(),
                            titleSize: FontSize.s14,
                            titleAlign: TextAlign.start,
                            titleColor: ColorManager.black,
                            fontWeightType: FontWeightType.medium,
                          ),
                        ),
                      ],
                    ),
                    const AppSizeBox(
                        height: 8
                    ),
                    Row(
                      children: [

                        Expanded(
                          flex: 1,
                          child:     DefaultTextFormField(
                          controller: widget.lowestPriceController,
                          hintTitle: 'TheLowest'.tr(),
                          labelTitle: 'TheLowest'.tr(),
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          hintFontSize: FontSize.s12,
                          hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textSize: FontSize.s12,
                          fillColor: ColorManager.textGrey,
                          borderColor: ColorManager.textGrey,
                          borderRadius: RadiusManager.r10,
                          validator: (v) => Validator().validatePrice(value: v.toString(),),
                        ),),

                        const AppSizeBox(width: 6,),
                        Expanded(
                          flex: 1,
                          child:     DefaultTextFormField(
                            controller: widget.abovePriceController,
                            hintTitle: 'theAbove'.tr(),
                            labelTitle: 'theAbove'.tr(),
                            textInputAction: TextInputAction.next,
                            textInputType: TextInputType.number,
                            hintFontSize: FontSize.s12,
                            hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                            textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                            textSize: FontSize.s12,
                            fillColor: ColorManager.textGrey,
                            borderColor: ColorManager.textGrey,
                            borderRadius: RadiusManager.r10,
                            validator: (v) => Validator().validatePrice(value: v.toString(),),
                          ),)
                      ],
                    ),

    SpaceItem(spaceController: widget.spaceController,title: 'space'.tr(),subTitle: 'meter'.tr(),fillColor: ColorManager.textGrey),

                    ValueListenableBuilder(valueListenable:   widget.selectedCategory,
                        builder: (context, value, child) => Column(
                          children: [
                            if(value.options.direction)
                              DirectionDropdownButton(
                                directions: Constants.directions,
                                notifier: widget.direction,
                              ),

                            if(value.options.streetWidth)
                              SpaceItem(spaceController: widget.streetWidthController,title: 'streetWidth'.tr(),
                                subTitle: 'meter1'.tr(),color: ColorManager.white,fillColor: ColorManager.textGrey, ),

                            if(value.options.floor)
                              PropertyItem(notifier: widget.floor, color: ColorManager.white, title: 'Floor'.tr(),),

                            if(value.options.floorsNo)
                              PropertyItem(notifier: widget.floorsNo, color: ColorManager.white, title: 'floors_no'.tr(),),

                            if(value.options.roomsNo)
                              PropertyItem(notifier: widget.bedrooms, color: ColorManager.white, title: 'bedrooms'.tr(),),

                            if(value.options.bathroomsNo)
                              PropertyItem(notifier: widget.bathrooms, color: ColorManager.white, title: 'Bathrooms'.tr(),),

                            if(value.options.kitchensNo)
                              PropertyItem(notifier: widget.kitchen, color: ColorManager.white, title: 'kitchen'.tr(),),

                            if(value.options.receptionsNo)
                              PropertyItem(notifier: widget.receptionsNo, color: ColorManager.white, title: 'receptionsNo'.tr(),),

                            if(value.options.apartmentsNo)
                              PropertyItem(notifier: widget.apartmentsNo, color: ColorManager.white, title: 'apartmentsNo'.tr(),),

                            if(value.options.storesNo)
                              PropertyItem(notifier: widget.storesNo, color: ColorManager.white, title: 'storesNo'.tr(),),

                            if(value.options.buildingAge)
                              PropertyItem(notifier: widget.buildingAge, color: ColorManager.white, title: 'buildingAge'.tr(),),
                          ],
                        )),
                    // FinishingItem(notifier: widget.finishing,),
                  ],
                ),
              )

            ],
          ),
        ),
      ],
    );
  }
  void onSelected({required HomeCatogeryModel value}){
    setState(() {
      widget.selectedCategory.value=value;
      widget. open.value=!widget.open.value;
      print('selectedCategory.value=${widget.selectedCategory.value.name}');
    });
  }
}
