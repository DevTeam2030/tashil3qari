part of'widget_imports.dart';

class ForSaleOrRentDropdownButton extends StatefulWidget {
  final  Function(AdType selectedType) onChanged;
  final  double? width;
  final  Color? color,borderColor;
  final AdType? selectedType;
  final String hint;
const ForSaleOrRentDropdownButton({Key? key,required this.onChanged,required this.hint,this.width,required this.selectedType,this.color,this.borderColor}) : super(key: key);

  @override
  State<ForSaleOrRentDropdownButton> createState() => _ForSaleOrRentDropdownButtonState();
}

class _ForSaleOrRentDropdownButtonState extends State<ForSaleOrRentDropdownButton> {

  AdType? selectedType;
  // AdType selectedType=AdType.forSale;
  List<AdType>types=[AdType.all,AdType.forSale,AdType.forRent];
  double width=.4.sw;
  @override
  void initState() {
    super.initState();
    selectedType=widget.selectedType;
    width=widget.width??.4.sw;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s40,

      decoration:Utils.returnDropdownButtonDecoration(
        widget.color ?? ColorManager.textGrey,widget.borderColor??ColorManager.white,RadiusManager.r20
      ),
      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<AdType>(
          isExpanded: true,
          isDense: true,
          value: selectedType,
          underline: const AppSizeBox(height: 0),
          hint:   Row(
            children: [
              // Icon(
              //   Icons.location_on,
              //   color: ColorManager.icons,
              //   size: 16,
              // ),
              // AppSizeBox(
              //   width: 4,
              // ),
              AppText(
                  title: widget.hint,
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s10,titleColor: ColorManager.icons),
            ],
          ),

          items: types.map((AdType type) => DropdownMenuItem<AdType>(
            value: type,
            child:  AppText(
                title: type==AdType.all?'all'.tr():type==AdType.forSale?'ForSale'.tr():'ForRent'.tr(),
                titleAlign: TextAlign.start,
                titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14,titleColor: ColorManager.icons)
          ))
              .toList(),
          onChanged: (value) {
            if(value==null||value==selectedType)return;
            setState(() {
              selectedType = value;
            });
            widget.onChanged(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.textGrey,
              ),
              color:widget.color ??ColorManager.white,
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
