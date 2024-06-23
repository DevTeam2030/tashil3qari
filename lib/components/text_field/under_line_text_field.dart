// part of'text_field_imports.dart';
//
// class UnderLineTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintTitle;
//   final String labelTitle;
//   final double textSize;
//   final double hintFontSize;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final Function(String? v ) validator;
//   final Function? onTap;
//   final bool readOnly;
//   const UnderLineTextFormField({Key? key,required this.controller,required this.hintTitle,required this.labelTitle,required this.validator,this.textInputType=TextInputType.text,
//     this.textInputAction=TextInputAction.next,this.hintFontSize=FontSize.s14,this.textSize=FontSize.s12,this.onTap,this.readOnly=false}) : super(key: key);
//
//   @override
//   State<UnderLineTextFormField> createState() => _UnderLineTextFormFieldState();
// }
//
// class _UnderLineTextFormFieldState extends State<UnderLineTextFormField> {
//   @override
//   Widget build(BuildContext context) {
//     return ConstrainedBox(
//       constraints: BoxConstraints(
//         // maxWidth: .8.sw,
//         // minWidth: .5.sw,
//         maxWidth: .88.sw,
//         minWidth: .7.sw,
//         minHeight: AppSize.s40.h,
//         // maxHeight: AppSize.s70.h
//       ),
//       child: TextFormField(
//         readOnly: widget.readOnly,
//         controller:widget.controller ,
//         keyboardType: widget.textInputType,
//         cursorColor:ColorManager.primary,
//         cursorWidth: 1,
//         style: getTextStyleRegular(color: ColorManager.black,fontSize: widget.textSize,underline: false),
//         validator: (v)=>widget.validator(v),
//         onTap:widget.onTap==null?(){}: (){
//           widget.onTap!();
//         },
//         decoration: InputDecoration(
//             contentPadding: const EdgeInsets.only(top: PaddingManager.p12,left: PaddingManager.p12,right:   PaddingManager.p12,),
//             hintText: widget.hintTitle,
//             labelText: widget.labelTitle,
//             hintStyle: getTextStyleRegular(color: ColorManager.borderSideTextField,fontSize: widget.hintFontSize,underline: false,
//                 fontFamily: FontContants.fontFamily),
//             labelStyle: getTextStyleRegular(color: ColorManager.primary,fontSize: widget.hintFontSize,underline: false,),
//             focusedBorder: const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.grey, width: .5),),
//             disabledBorder: const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.grey, width: .5),),
//             // enabledBorder:   const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.secondary, width: 1),),
//             border:   const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.grey, width: .5),),
//             enabledBorder:   const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.grey, width: .5),),
//
//             suffixIcon: const Icon(Icons.arrow_drop_down,color: ColorManager.grey1),
//             errorStyle:  const TextStyle(fontSize:FontSize.s10)
//         ),
//         textInputAction: widget.textInputAction,
//
//       ),
//     );
//   }
// }
