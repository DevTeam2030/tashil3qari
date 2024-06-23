part of 'widgets_imports.dart';

class AdActionDropdownButton extends StatefulWidget {
  final PersonalProfileData personalProfileData;
  final UserAdsModel ad;
  const AdActionDropdownButton({super.key, required this.personalProfileData,required this.ad});


  @override
  State<AdActionDropdownButton> createState() => _AdActionDropdownButtonState();
}

class _AdActionDropdownButtonState extends State<AdActionDropdownButton> {
  String? selectedFilter;
   List<String> filters=[];
  @override
  void initState() {
    super.initState();

    setList();
  }
double width=120.0;
  @override
  Widget build(BuildContext context) {
    setList();
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        // isExpanded: true,
        isDense: false,
        value: selectedFilter,
        underline: const AppSizeBox(height: 0),
        hint:   null,
        customButton: Padding(
          padding: const EdgeInsets.only(bottom: 14),
          child: CircleAvatar(
              radius: 16,
              backgroundColor: ColorManager.white,
              child: Icon(Icons.more_horiz,size: 20,color: ColorManager.black,)),
        ),
        items: filters
            .map((String filter) => DropdownMenuItem<String>(
          value: filter,
          child:  AppText(
              title: filter,
              titleAlign: TextAlign.center,
              titleMaxLines: 1,fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s12,
              titleColor:filter==filters.last ?ColorManager.red:ColorManager.black)
        ))
            .toList(),
        onChanged: (value) {
          if(value=='Delete'.tr())widget.personalProfileData.deleteMyAd(context: context, ad: widget.ad);
          else  if(value=='StopAd'.tr())widget.personalProfileData.unPublishProperty(context: context, ad: widget.ad);
          else  if(value=='PostAd'.tr())widget.personalProfileData.publishProperty( ad: widget.ad);
          else  if(value=='RemoveFromAuction'.tr())widget.personalProfileData.removeFromAuction(context: context, ad: widget.ad);
          else  if(value=='addToAuction'.tr())widget.personalProfileData.addToAuction(context: context, ad: widget.ad);
          else  if(value=='HighlightAd'.tr()) MyRoute().navigate(context: context, route: AddAdFeaturedScreen(propertyId: widget.ad.id,));
          else{}
          setState(() {

          });
        },
        buttonStyleData: ButtonStyleData(
          height: 30,
          width: 30,
          // padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color:ColorManager.textGrey,
              shape: BoxShape.circle
          ),
          // elevation: 2,
        ),

        iconStyleData:  IconStyleData(
          icon:Center(
            child: Icon(Icons.more_horiz,
              color: ColorManager.black,size: AppSize.s20,),
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.red,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 140,
          width: width,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: ColorManager.white,
          ),
          offset: const Offset(100, 10),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(ColorManager.primary),
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(3),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 30,
          // padding: EdgeInsets.only(left: 6, right: 6),
        ),
      ),
    );


  }
  setList(){
    filters=[];
    if(widget.ad.published) {
      filters.add('StopAd'.tr());
    } else {
      filters.add('PostAd'.tr());
    }
    if(widget.ad.auction) {
      filters.add('RemoveFromAuction'.tr());
    } else {
      filters.add('addToAuction'.tr());

    }
    if(!widget.ad.featured)filters.add('HighlightAd'.tr());

    filters.add('Delete'.tr());
  }
}
