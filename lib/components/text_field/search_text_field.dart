part of'text_field_imports.dart';

class SearchTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final int? maxLength;
  final double ?textSize;
  final double? hintFontSize;
  final Color? fillColor;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String? v ) validator;
  final Function() onSearch;
  const SearchTextFormField({Key? key,required this.controller,this.fillColor,
    required this.hintTitle,required this.labelTitle,required this.onSearch,
    this.maxLength,required this.validator,this.textInputType=TextInputType.text,
    this.textInputAction=TextInputAction.next,this.textSize=FontSize.s14,
    this.hintFontSize=FontSize.s12}) : super(key: key);

  @override
  State<SearchTextFormField> createState() => _SearchTextFormFieldState();
}

class _SearchTextFormFieldState extends State<SearchTextFormField> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: .92.sw,
        minWidth: .7.sw,
        minHeight: AppSize.s40.h,
        // maxHeight: AppSize.s70.h
      ),
      child: TextFormField(
        controller:widget.controller ,
        keyboardType: widget.textInputType,
        cursorColor:ColorManager.primary,
        cursorWidth: 1,
        style: getAppTextStyle(titleColor: ColorManager.primary,
            titleSize: widget.textSize,underline: false),
        validator: (v)=>widget.validator(v),
        decoration: InputDecoration(
          fillColor:widget.fillColor?? ColorManager.white,
          filled: true,
            contentPadding: const EdgeInsets.only(right: PaddingManager.p12,left: PaddingManager.p12,bottom: PaddingManager.p2),
            // enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.borderSideTextField, width: 1)),
            // focusedBorder: const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.secondary, width: 1),),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s06),
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s06),
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
            errorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
            focusedErrorBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
                borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
            hintText: widget.hintTitle,
            labelText: widget.labelTitle,
            hintStyle: getAppTextStyle(titleColor: ColorManager.grey.withOpacity(.4),
                titleSize: widget.hintFontSize,underline: false),
            labelStyle: getAppTextStyle(titleColor: ColorManager.grey.withOpacity(.4),
                titleSize: widget.hintFontSize,underline: false),
            errorStyle:  const TextStyle(fontSize:FontSize.s10),

            // prefixIcon:  Icon( Icons.lock, color:ColorManager.grey ,size: AppSize.s20.w,),
            suffixIcon:  InkWell(
                onTap: () =>widget.onSearch(),
                child: Icon(FontAwesomeIcons.search,
                  color:ColorManager.grey.withOpacity(.4) ,size: AppSize.s20.w,))
        ),
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,

      ),
    );
  }
}
