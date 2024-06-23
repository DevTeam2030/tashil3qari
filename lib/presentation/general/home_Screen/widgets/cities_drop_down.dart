part of'widget_imports.dart';

class CitiesDropdownButton extends StatefulWidget {
  final  Function() onChanged;
  final  double? width;

 //  final List<String> cities;
 // final String? selectedcity;
 //  const CitiesDropdownButton({Key? key,required this.onChanged,required this.cities,required this.selectedcity}) : super(key: key);
  const CitiesDropdownButton({Key? key,required this.onChanged,this.width}) : super(key: key);

  @override
  State<CitiesDropdownButton> createState() => _CitiesDropdownButtonState();
}

class _CitiesDropdownButtonState extends State<CitiesDropdownButton> {

  CountryModel? selectedCountry;
  List<CountryModel>countries=[];
  double width=.45.sw;
  @override
  void initState() {
    super.initState();
    width=widget.width??.45.sw;
    countries=Constants.settingModel.countries;
    selectedCountry=context.read<GeneralProvider>().mapCountry;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s40,
      decoration:Utils.returnDropdownButtonDecoration(
          ColorManager.textGrey,ColorManager.white,RadiusManager.r14
      ),
      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<CountryModel>(
          isExpanded: true,
          isDense: true,
          value: selectedCountry,
          underline: const AppSizeBox(height: 0),
          hint:   Row(
            children: [
              Icon(
                Icons.location_on,
                color: ColorManager.icons,
                size: 16,
              ),
              AppSizeBox(
                width: 4,
              ),
              AppText(
                  title: 'Please select city'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s10,titleColor: ColorManager.icons),
            ],
          ),

          items: countries.map((CountryModel country) => DropdownMenuItem<CountryModel>(
            value: country,
            child:  AppText(
                title: country.name,
                titleAlign: TextAlign.start,
                titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14,titleColor: ColorManager.icons)
          ))
              .toList(),
          onChanged: (value) {
            if(value==null||context.read<GeneralProvider>().mapCountry==value)return;
            setState(() {
              selectedCountry = value;
              context.read<GeneralProvider>().mapCountry=value;
            });
            widget.onChanged();
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width,
            padding: const EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.textGrey,
              ),
              color:ColorManager.white,
            ),
            // elevation: 2,
          ),

          iconStyleData: const IconStyleData(
            icon:Icon(Icons.arrow_drop_down_sharp,
              color: ColorManager.icons,size: AppSize.s20,),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorManager.textGrey,
            ),
            offset: const Offset(4, -10),
            scrollbarTheme: ScrollbarThemeData(
              thumbColor: MaterialStateProperty.all(ColorManager.primary),
              radius: const Radius.circular(40),
              thickness: MaterialStateProperty.all(3),
              thumbVisibility: MaterialStateProperty.all(true),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            height: 40,
            padding: EdgeInsets.only(left: 14, right: 14),
          ),
        ),
      ),
    );


  }
}
