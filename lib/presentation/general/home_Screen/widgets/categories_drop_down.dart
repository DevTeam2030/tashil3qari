part of'widget_imports.dart';

class CategoriesDropdownButton extends StatefulWidget {
  final  Function(HomeCatogeryModel selectedCategory) onChanged;
  final  double? width;
  final  Color? color,borderColor;
  final HomeCatogeryModel? selectedCategory;
const CategoriesDropdownButton({Key? key,required this.onChanged,this.width,required this.selectedCategory,this.color,this.borderColor}) : super(key: key);

  @override
  State<CategoriesDropdownButton> createState() => _CategoriesDropdownButtonState();
}

class _CategoriesDropdownButtonState extends State<CategoriesDropdownButton> {

   HomeCatogeryModel? selectedCategory;
  var categories=Constants.settingModel.categories;
  double width=.4.sw;
  @override
  void initState() {
    super.initState();
    selectedCategory=widget.selectedCategory;
    // selectedCategory=widget.selectedCategory??categories.first;
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
        child: DropdownButton2<HomeCatogeryModel>(
          isExpanded: true,
          isDense: true,
          value: selectedCategory,
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
                  title: 'Category'.tr(),
                  titleAlign: TextAlign.start,
                  titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                  titleSize: FontSize.s10,titleColor: ColorManager.icons),
            ],
          ),

          items: categories.map((HomeCatogeryModel type) => DropdownMenuItem<HomeCatogeryModel>(
            value: type,
            child:  AppText(
                title: type.name,
                titleAlign: TextAlign.start,
                titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s14,titleColor: ColorManager.icons)
          ))
              .toList(),
          onChanged: (value) {
            if(value==null||value==selectedCategory)return;
            setState(() {
              selectedCategory = value;
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
