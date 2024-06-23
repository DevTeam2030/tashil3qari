part of'text_field_imports.dart';

class MoreLineTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final bool? isPasswordTextFieldForm;
  final Widget? prefixIcon;
  final int? maxLines;
  final double textSize;
  final double hintFontSize;
  final bool enabled;
  final bool? showSuffix;
  final Color? fillColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String? v ) validator;
  final Color? borderColor;
  final double? borderRadius;
  const MoreLineTextFormField({Key? key,required this.controller,required this.hintTitle,required this.labelTitle,this.showSuffix=true,
    this.maxLines=1,required this.validator,this.textInputType=TextInputType.text,this.enabled=true,
    this.textInputAction=TextInputAction.next,this.hintFontSize=FontSize.s16,this.hintStyle,this.textStyle,
    this.textSize=FontSize.s16,this.isPasswordTextFieldForm=false,this.fillColor,this.prefixIcon, this.borderColor,    this.borderRadius,}) : super(key: key);

  @override
  State<MoreLineTextFormField> createState() => _MoreLineTextFormFieldState();
}

class _MoreLineTextFormFieldState extends State<MoreLineTextFormField> {

  @override
  Widget build(BuildContext context) {
    return   ConstrainedBox(
      constraints: BoxConstraints(
          maxWidth: 1.0.sw,
          minWidth: .7.sw,
          minHeight: .1.sh,
          maxHeight: .8.sh
      ),
      child: TextFormField(
        controller:widget.controller ,
        // keyboardType: widget.textInputType,
        keyboardType: TextInputType.multiline,
        enabled: widget.enabled,
        cursorColor:ColorManager.primary,
        cursorWidth: 1,
        textAlign: TextAlign.start,
        style:widget.textStyle?? getAppTextStyle(titleColor: ColorManager.text,fontWeightType: FontWeightType.regular,
            titleSize: widget.textSize,underline: false),
        validator: (v)=>widget.validator(v),
        decoration: InputDecoration(
          alignLabelWithHint: true,
          prefixIcon: widget.prefixIcon==null?null:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 16,
                  backgroundColor: ColorManager.white,
                  child: widget.prefixIcon),
            ],
          ),
          fillColor:widget.fillColor?? ColorManager.white,
          filled: true,
          contentPadding: const EdgeInsets.only(right: PaddingManager.p12,
              left: PaddingManager.p12,top:  PaddingManager.p10,bottom:  PaddingManager.p10),
          // enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.borderSideTextField, width: 1)),
          // focusedBorder: const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.secondary, width: 1),),
          focusedBorder:  OutlineInputBorder(
              borderSide: BorderSide(color:  widget.borderColor??ColorManager.primary, width: AppSize.s06),
              borderRadius:  BorderRadius.all(Radius.circular(widget.borderRadius??AppSize.s6))),
          enabledBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: widget.borderColor??ColorManager.primary, width: AppSize.s06),
              borderRadius:  BorderRadius.all(Radius.circular(widget.borderRadius??AppSize.s6))),
          errorBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
              borderRadius:  BorderRadius.all(Radius.circular(widget.borderRadius??AppSize.s6))),
          focusedErrorBorder:  OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
              borderRadius:  BorderRadius.all(Radius.circular(widget.borderRadius??AppSize.s6))),
          border:   OutlineInputBorder(
              borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
              borderRadius:  BorderRadius.all(Radius.circular(widget.borderRadius??AppSize.s6))),
          hintText: widget.hintTitle,
          labelText: widget.labelTitle,
          hintStyle:widget.hintStyle?? getAppTextStyle(titleColor: ColorManager.grey,
              titleSize: widget.hintFontSize,underline: false),
          labelStyle:widget.hintStyle?? getAppTextStyle(titleColor: ColorManager.grey,
              titleSize: widget.hintFontSize,underline: false),
          errorStyle:  const TextStyle(fontSize:FontSize.s10),



        ),
        // maxLength: 50,
        maxLines: widget.maxLines,
        textInputAction: widget.textInputAction,


      ),
    );
  }
}