part of'widgets_imports.dart';



class EditAdMoreDropdownButton extends StatefulWidget {
  final EditAdData editAdData;
  const EditAdMoreDropdownButton({super.key, required this.editAdData});


  @override
  State<EditAdMoreDropdownButton> createState() => _EditAdMoreDropdownButtonState();
}

class _EditAdMoreDropdownButtonState extends State<EditAdMoreDropdownButton> {
  String? selectedFilter;
  final List<String> filters=['update'.tr(),'HighlightAd'.tr(),'Close ad'.tr(),'Pending ad'.tr(),'Cancel ad'.tr()];
  @override

  void initState() {
    super.initState();
  }
double width=120.0;
  @override
  Widget build(BuildContext context) {
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
              backgroundColor: ColorManager.textGrey,
              child: Icon(Icons.more_horiz,size: 20,color: ColorManager.grey1,)),
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
          setState(() {
            selectedFilter = value;
          });
          if(selectedFilter==filters[2]){
            Utils.showModalBottomSheetApp(widget:CloseAdBottomSheet(editAdData: widget.editAdData,));
          }

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
              color: ColorManager.grey1,size: AppSize.s20,),
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 180,
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
}
