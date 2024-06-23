part of'text_field_imports.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final String hintTitle;
  final String labelTitle;
  final int? maxLength;
  final double ?textSize;
  final double? hintFontSize;
  final TextInputType? textInputType;
  final TextInputAction? textInputAction;
  final Function(String? v ) validator;
  const PasswordTextFormField({Key? key,required this.controller,
    required this.hintTitle,required this.labelTitle,
     this.maxLength,required this.validator,this.textInputType=TextInputType.text,
    this.textInputAction=TextInputAction.next,this.textSize=FontSize.s14,this.hintFontSize=FontSize.s16}) : super(key: key);

  @override
  State<PasswordTextFormField> createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  bool isPassword=false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:PaddingManager.p12),
      child: ConstrainedBox(
        constraints: BoxConstraints(
            maxWidth: .88.sw,
            minWidth: .7.sw,
            minHeight: AppSize.s50.h,
            // maxHeight: AppSize.s70.h
        ),
        child: TextFormField(
          controller:widget.controller ,
          obscureText: isPassword,
          keyboardType: widget.textInputType,
          cursorColor:ColorManager.primary,
          inputFormatters: const [
            // FilteringTextInputFormatter.allow(RegExp(r'[a-zA-z]'))

          ],
          cursorWidth: 1,
          style: getAppTextStyle(titleColor: ColorManager.primary,
              titleSize: widget.textSize,underline: false),
          validator: (v)=>widget.validator(v),
          decoration: InputDecoration(
            // fillColor: ColorManager.black12,
            // filled: true,
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
              hintStyle: getAppTextStyle(titleColor: ColorManager.hintColor,
                  titleSize: widget.hintFontSize,underline: false),
              labelStyle: getAppTextStyle(titleColor: ColorManager.hintColor,
                  titleSize: widget.hintFontSize,underline: false),
              errorStyle:  const TextStyle(fontSize:FontSize.s10),
            // suffix: InkWell(
            //     onTap: () {
            //       setState(() {
            //         isPassword = !isPassword;
            //       });
            //     },
            //     child: Icon(isPassword
            //         ? Icons.visibility
            //         : Icons.visibility_off,
            //     color:isPassword?ColorManager.primary:ColorManager.grey ,size: AppSize.s25.w,)),
            prefixIcon:  Icon( Icons.lock, color:ColorManager.grey ,size: AppSize.s20.w,),
            suffixIcon:  InkWell(
              onTap: () {
        setState(() {
        isPassword = !isPassword;
        });
        },
            child: Icon(isPassword
                ? Icons.visibility
                : Icons.visibility_off,
              color:isPassword?ColorManager.primary:ColorManager.grey ,size: AppSize.s20.w,))
          ),
          maxLength: widget.maxLength,
          textInputAction: widget.textInputAction,

        ),
      ),
    );
  }
}
