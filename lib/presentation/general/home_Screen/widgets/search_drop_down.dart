part of'widget_imports.dart';

class SearchDropdownButton extends StatefulWidget {
  final  Function(String? v) onChanged;
  final List<String> filters;
  final String? selectedFilter;
  const SearchDropdownButton({Key? key,required this.onChanged,required this.filters,required this.selectedFilter}) : super(key: key);


  @override
  State<SearchDropdownButton> createState() => _SearchDropdownButtonState();
}

class _SearchDropdownButtonState extends State<SearchDropdownButton> {
  String? selectedFilter;
  @override
  void initState() {
    super.initState();
    selectedFilter=widget.selectedFilter;
  }
double width=100.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: AppSize.s35,
      decoration: BoxDecoration(
          color: ColorManager.primary,
          border: Border.all(color: ColorManager.primary,width: AppSize.s06),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(RadiusManager.r14),
              topRight: Radius.circular(RadiusManager.r14)

          )),


      // padding: EdgeInsets.symmetric(horizontal: PaddingManager.p4),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          // isExpanded: true,
          isDense: true,
          value: selectedFilter,
          underline: const AppSizeBox(height: 0),
          hint:   AppText(
              title: 'search'.tr(),
              titleAlign: TextAlign.center,
              titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
              titleSize: FontSize.s12,titleColor: ColorManager.white),

          items: widget.filters
              .map((String filter) => DropdownMenuItem<String>(
            value: filter,
            child:  AppText(
                title: filter,
                titleAlign: TextAlign.center,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s12,titleColor: ColorManager.white)
          ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedFilter = value;
            });
            widget.onChanged(value);
          },
          buttonStyleData: ButtonStyleData(
            height: 50,
            width: width,
            padding: const EdgeInsets.only(left: 5, right: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(
                color: ColorManager.primary,
              ),
              color:ColorManager.primary,
            ),
            // elevation: 2,
          ),

          iconStyleData:  IconStyleData(
            icon:Icon(Icons.arrow_drop_down_sharp,
              color: ColorManager.white,size: AppSize.s20,),
            iconSize: 14,
            iconEnabledColor: Colors.yellow,
            iconDisabledColor: Colors.grey,
          ),
          dropdownStyleData: DropdownStyleData(
            maxHeight: 200,
            width: width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: ColorManager.white,
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
            padding: EdgeInsets.only(left: 6, right: 6),
          ),
        ),
      ),
    );


  }
}
