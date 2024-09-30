part of 'widget_imports.dart';

class HomeDropdownButton extends StatefulWidget {
  const HomeDropdownButton({super.key, });


  @override
  State<HomeDropdownButton> createState() => _HomeDropdownButtonState();
}

class _HomeDropdownButtonState extends State<HomeDropdownButton> {
  String? selectedFilter;
   List<String> filters=[];
  @override
  void initState() {
    super.initState();

    setList();
  }
double width=170.0;
  @override
  Widget build(BuildContext context) {
    setList();
    return Padding(
      padding: const EdgeInsets.only(top:8.0),
      child: DropdownButtonHideUnderline(
        child: DropdownButton2<String>(
          // isExpanded: true,
          isDense: false,
          value: selectedFilter,
          underline: const AppSizeBox(height: 0),
          hint:   null,
          customButton: Padding(
            padding: const EdgeInsets.only(bottom: 14),
            child: CircleAvatar(
                radius: 12,
                backgroundColor: ColorManager.primary,
                child: Icon(Icons.more_horiz,size: 20,color: ColorManager.white,)),
          ),
          items: filters
              .map((String filter) => DropdownMenuItem<String>(
            value: filter,
            child:  AppText(
                title: filter,
                titleAlign: TextAlign.center,
                titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s12,
                titleColor:ColorManager.black)
          ))
              .toList(),
          onChanged: (value) {

            if(value=='Terms and Conditions'.tr()) MyRoute().navigate(context: context, route: const TermsOfUseScreen());
           else if(value=='privacyPolicyTerms'.tr()) MyRoute().navigate(context: context, route: const PrivacyPolicyScreen());
              else{}
            setState(() {});
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
            offset: const Offset(100, 5),
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
      ),
    );


  }
  setList(){
    filters=[];
    filters.add('Terms and Conditions'.tr());
    filters.add('privacyPolicyTerms'.tr());

  }
}
