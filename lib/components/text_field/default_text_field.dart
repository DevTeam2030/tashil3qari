part of'text_field_imports.dart';

class DefaultTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final Function? onTap;
  final bool? isPasswordTextFieldForm;
  final Widget? prefixIcon,suffixIcon;
  // final int? maxLength;
  final double textSize;
  final double? borderRadius;
  final double hintFontSize;
  final int? maxLength;
  final bool enabled;
  final bool? showSuffix;
  final bool? showSuffixColor;
  final Color? fillColor;
  final Color? borderColor;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String? v ) validator;
  final Function(String? v )? onChanged;
  final Function()? onEditingComplete;
  const DefaultTextFormField({Key? key,required this.controller,required this.hintTitle,required this.labelTitle,this.showSuffix=true,
    // this.maxLength,
    this.onTap,this.showSuffixColor=true,this.onEditingComplete,this.onChanged,
    required this.validator,this.textInputType=TextInputType.text,this.enabled=true,
    this.textInputAction=TextInputAction.next,this.hintFontSize=FontSize.s16,this.hintStyle,this.textStyle,
    this.textSize=FontSize.s16,this.isPasswordTextFieldForm=false,
    this.fillColor, this.borderColor,    this.borderRadius,this.maxLength,
    this.prefixIcon,this.suffixIcon}) : super(key: key);

  @override
  State<DefaultTextFormField> createState() => _DefaultTextFormFieldState();
}

class _DefaultTextFormFieldState extends State<DefaultTextFormField> {
  bool isPassword=false;
  @override
  void initState() {
    super.initState();
    isPassword=widget.isPasswordTextFieldForm??false;
  }
  @override
  Widget build(BuildContext context) {
    return   ConstrainedBox(
      constraints: BoxConstraints(
        maxWidth: 1.0.sw,
        minWidth: .7.sw,
        minHeight: AppSize.s40,
        // maxHeight: AppSize.s50.h
      ),
      child: TextFormField(
        controller:widget.controller ,
        keyboardType: widget.textInputType,
        cursorColor:ColorManager.primary,
        obscureText: isPassword,
        cursorWidth: 1,
        enabled: widget.enabled,
        onTap: (){
          if(widget.onTap!=null) widget.onTap!();
        },
        style:widget.textStyle?? getAppTextStyle(titleColor: ColorManager.text,fontWeightType: FontWeightType.regular,
            titleSize: widget.textSize,underline: false),
        validator: (v)=>widget.validator(v),
        onChanged: (v){
          if(widget.onChanged!=null)widget.onChanged!(v);
        },
        onEditingComplete: (){
          if(widget.onEditingComplete!=null)widget.onEditingComplete!();
        },
        decoration: InputDecoration(
          suffixIcon: widget.isPasswordTextFieldForm!=true?widget.suffixIcon:InkWell(
              onTap: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              child: Icon(isPassword
                  ? Icons.visibility
                  : Icons.visibility_off,
                color:isPassword?ColorManager.grey:ColorManager.grey ,size: AppSize.s20.w,)),
          prefixIcon: widget.prefixIcon,
          // Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     CircleAvatar(
          //       radius: 16,
          //       backgroundColor: ColorManager.primary,
          //       child: CircleAvatar(
          //           radius: 15,
          //           // backgroundColor:widget.showSuffixColor==true?ColorManager.textFormFieldFillColor: ColorManager.white,
          //           backgroundColor: ColorManager.white,
          //           child: widget.prefixIcon),
          //     ),
          //   ],
          // ),
          fillColor:widget.fillColor?? ColorManager.white,
          filled: true,
          contentPadding: const EdgeInsets.symmetric(horizontal: PaddingManager.p12,vertical:  PaddingManager.p12),
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
          border: OutlineInputBorder(
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
        maxLength: widget.maxLength,
        textInputAction: widget.textInputAction,

      ),
    );
  }
}
