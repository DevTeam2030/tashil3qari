// part of'text_field_imports.dart';
//
// class PhoneTextFormField extends StatefulWidget {
//   final TextEditingController controller;
//   final String hintTitle;
//   final String labelTitle;
//   final Function? onTap;
//   final bool? isPasswordTextFieldForm;
//   final CountryModel country;
//   // final  Fuction(CountryModel) onCountryChanged;
//   // final int? maxLength;
//   final double textSize;
//   final double hintFontSize;
//   final bool enabled;
//   final bool? showSuffix;
//   final bool? showSuffixColor;
//   final Color? fillColor;
//   final TextStyle? hintStyle;
//   final TextStyle? textStyle;
//   final TextInputType? textInputType;
//   final TextInputAction? textInputAction;
//   final Function(String? v ) validator;
//   final Function(CountryModel v ) onCountryChanged;
//   const PhoneTextFormField({Key? key,required this.controller,required this.hintTitle,required this.labelTitle,this.showSuffix=true,
//     // this.maxLength,
//     this.onTap,this.showSuffixColor=true,
//     required this.onCountryChanged,
//     required this.validator,this.textInputType=TextInputType.text,this.enabled=true,
//     this.textInputAction=TextInputAction.next,this.hintFontSize=FontSize.s16,this.hintStyle,this.textStyle,
//     this.textSize=FontSize.s16,this.isPasswordTextFieldForm=false,this.fillColor,
//     required this.country}) : super(key: key);
//
//   @override
//   State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
// }
//
// class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
//   late CountryModel selectedCountry;
//   List<CountryModel> countries=Constants.navigatorAppKey.currentState!.context.read<AddressProvider>().countries;
//
//   @override
//   void initState() {
//     super.initState();
//     if(mounted)selectedCountry=widget.country;
//
//   }
//   @override
//   Widget build(BuildContext context) {
//     return   ConstrainedBox(
//       constraints: BoxConstraints(
//         maxWidth: 1.0.sw,
//         minWidth: .7.sw,
//         minHeight: AppSize.s40.h,
//         // maxHeight: AppSize.s50.h
//       ),
//       child: TextFormField(
//         controller:widget.controller ,
//         keyboardType: widget.textInputType,
//         cursorColor:ColorManager.primary,
//
//         cursorWidth: 1,
//         enabled: widget.enabled,
//         onTap: (){
//           if(widget.onTap!=null) widget.onTap!();
//         },
//         style:widget.textStyle?? getAppTextStyle(titleColor: ColorManager.text,fontWeightType: FontWeightType.regular,
//             titleSize: widget.textSize,underline: false),
//         validator: (v)=>widget.validator(v),
//         decoration: InputDecoration(
//           prefixIcon: SizedBox(
//             width: AppSize.s110,
//             child: Padding(
//               padding:  EdgeInsets.only(
//                   right:Constants.isArabic?PaddingManager.p10:0,
//                   left:Constants.isArabic?0:PaddingManager.p10
//               ),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 16,
//                     backgroundColor:ColorManager.primary,
//                     child: CircleAvatar(
//                         radius: 15,
//                         backgroundColor:widget.showSuffixColor==false?ColorManager.textFormFieldFillColor: ColorManager.white,
//                         child: const Icon(Icons.call_outlined,color: ColorManager.primary,size: AppSize.s16)),
//                   ),
//                   SizedBox(
//                     width: AppSize.s66,
//                     child: DropdownButton<CountryModel>(
//
//                       // Initial Value
//                       value: selectedCountry,
//                       borderRadius: BorderRadius.circular(AppSize.s10),
//                       underline: const AppSizeBox(height: 0),
//                       hint:   AppText(
//                           title: '+00',
//                           titleAlign: TextAlign.start,
//                           titleMaxLines: 1,fontWeightType: FontWeightType.regular,
//                           titleSize: FontSize.s14,titleColor: ColorManager.black),
//
//                       // Down Arrow Icon
//                       icon:Icon(Icons.arrow_drop_down_sharp,
//                         color: ColorManager.black,size: AppSize.s30,),
//                       elevation: 4,
//                       isExpanded: false,
//                       // Array list of items
//                       items: countries.map((CountryModel country) {
//                         return DropdownMenuItem(
//                           value: country,
//                           child:  AppText(
//                               title: country.countryCode,
//                               titleAlign: TextAlign.start,
//                               titleMaxLines: 1,fontWeightType: FontWeightType.regular,
//                               titleSize: FontSize.s14,titleColor: ColorManager.black),
//                         );
//                       }).toList(),
//                       // After selecting the desired option,it will
//                       // change button value to selected value
//                       onChanged: (CountryModel? newValue) {
//
//                         if(newValue==null)return;
//                         selectedCountry = newValue;
//                         widget.onCountryChanged(newValue);
//                         // setState(() {});
//
//                       },
//                     ),
//                   ),
//
//                   Container(
//                     height: AppSize.s30,
//                     width: 1,
//                     color: ColorManager.grey,
//                   )
//                 ],
//               ),
//             ),
//           ),
//           fillColor:widget.fillColor?? ColorManager.white,
//           filled: true,
//           contentPadding: const EdgeInsets.only(right: PaddingManager.p12,
//               left: PaddingManager.p12,top: 0,bottom: 0),
//           // enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: ColorManager.borderSideTextField, width: 1)),
//           // focusedBorder: const UnderlineInputBorder(borderSide:  BorderSide(color: ColorManager.secondary, width: 1),),
//           focusedBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s06),
//               borderRadius: BorderRadius.all(Radius.circular(AppSize.s6))),
//           enabledBorder: const OutlineInputBorder(
//               borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s06),
//               borderRadius: BorderRadius.all(Radius.circular(AppSize.s6))),
//           errorBorder:  OutlineInputBorder(
//               borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
//               borderRadius: const BorderRadius.all(Radius.circular(AppSize.s10))),
//           focusedErrorBorder:  OutlineInputBorder(
//               borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
//               borderRadius: const BorderRadius.all(Radius.circular(AppSize.s6))),
//           hintText: widget.hintTitle,
//           labelText: widget.labelTitle,
//           hintStyle:widget.hintStyle?? getAppTextStyle(titleColor: ColorManager.grey,
//               titleSize: widget.hintFontSize,underline: false),
//           labelStyle:widget.hintStyle?? getAppTextStyle(titleColor: ColorManager.grey,
//               titleSize: widget.hintFontSize,underline: false),
//           errorStyle:  const TextStyle(fontSize:FontSize.s10),
//
//         ),
//         // maxLength: widget.maxLength,
//         textInputAction: widget.textInputAction,
//
//       ),
//     );
//   }
// }
//
//
// // class PhoneTextFormField extends StatefulWidget {
// //   final TextEditingController controller;
// //   final String hintTitle;
// //   final String labelTitle;
// //   final Widget? suffixIcon;
// //   final Widget? prefixIcon;
// //   final int? maxLength;
// //   final double textSize;
// //   final double hintFontSize;
// //   final bool enabled;
// //   final TextInputType? textInputType;
// //   final TextInputAction? textInputAction;
// //   final Function(String? v ) validator;
// //   // final Function onCountryTap;
// //   // final CountryModel selectedCountry;
// //   const PhoneTextFormField({Key? key,required this.controller,required this.hintTitle,required this.labelTitle,
// //     this.prefixIcon,
// //     // required this.selectedCountry,required this.onCountryTap,
// //    this.maxLength,required this.validator,this.textInputType=TextInputType.text,this.enabled=true,
// //   this.textInputAction=TextInputAction.next,this.hintFontSize=FontSize.s16,this.textSize=FontSize.s16,this.suffixIcon}) : super(key: key);
// //
// //   @override
// //   State<PhoneTextFormField> createState() => _PhoneTextFormFieldState();
// // }
// //
// // class _PhoneTextFormFieldState extends State<PhoneTextFormField> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top:PaddingManager.p12),
// //       child: Directionality(
// //         textDirection: TextDirection.ltr,
// //         child: ConstrainedBox(
// //           constraints: BoxConstraints(
// //             // maxWidth: .8.sw,
// //             // minWidth: .5.sw,
// //               maxWidth: .88.sw,
// //               minWidth: .7.sw,
// //             minHeight: AppSize.s50.h,
// //             // maxHeight: AppSize.s70.h
// //           ),
// //           child: TextFormField(
// //             // textAlign: TextAlign.end,
// //             controller:widget.controller ,
// //             keyboardType: widget.textInputType,
// //             cursorColor:ColorManager.primary,
// //             cursorWidth: 1,
// //             enabled:widget.enabled ,
// //             style: getAppTextStyle(titleColor: ColorManager.primary,titleSize: widget.textSize,underline: false),
// //             validator: (v)=>widget.validator(v),
// //             inputFormatters: const [
// // // FilteringTextInputFormatter.allow(RegExp(r'[1-9]'))
// //             ],
// //
// //             decoration: InputDecoration(
// //               suffixIcon: widget.suffixIcon,
// //                 prefixIcon: Container(
// //                   // padding: const EdgeInsets.only(bottom: PaddingManager.p2,),
// //                   constraints: BoxConstraints(
// //                     // maxWidth: .8.sw,
// //                       minWidth: 100,
// //                       minHeight: AppSize.s52.h
// //                   ),
// //                   // decoration:   BoxDecoration(
// //                   //   border: Border(
// //                   //     bottom: BorderSide(width: 1, color: ColorManager.grey),
// //                   //   ),
// //                   // ),
// //                   height: AppSize.s22.h,
// //                   width: AppSize.s80.w,
// //                   child: Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// //                     children: [
// //                       // Container(
// //                       //   height: AppSize.s25.h,width: AppSize.s30.w,
// //                       //   decoration: BoxDecoration(
// //                       //     borderRadius: BorderRadius.circular(RadiusManager.r6),
// //                       //     image: const DecorationImage(
// //                       //       image: AssetImage(ImageManager.saudiaFlag)
// //                       //     )
// //                       //   ),
// //                       //   // child: Image.asset(ImageManager.saudiaFlag,fit: BoxFit.fill,
// //                       //   //   height: AppSize.s25.h,width: AppSize.s30.w,),
// //                       // ),
// //                        AppText(title: '+966', titleSize: FontSize.s16,titleColor: ColorManager.grey),
// //
// //                       Container(
// //                         height: AppSize.s25.h,
// //                         width: AppSize.s1,
// //                         color: ColorManager.grey,
// //                       )
// //
// //                       // SizedBoxWidth(width: AppSize.s8.w),
// //                     ],
// //                   ),
// //                 ),
// //                 floatingLabelBehavior: FloatingLabelBehavior.always,
// //                 border: InputBorder.none,
// //                 // prefixIcon: Icon(FontAwesomeIcons.mobile),
// //
// //               contentPadding: const EdgeInsets.only(right: PaddingManager.p12,left: PaddingManager.p12,),
// //                 focusedBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s06),
// //                     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
// //                 enabledBorder: OutlineInputBorder(
// //                     borderSide: BorderSide(color: ColorManager.grey, width: AppSize.s06),
// //                     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
// //                 errorBorder:  OutlineInputBorder(
// //                     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
// //                     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
// //                 focusedErrorBorder:  OutlineInputBorder(
// //                     borderSide: BorderSide(color: ColorManager.error, width: AppSize.s06),
// //                     borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))),
// //               hintText: widget.hintTitle,
// //                 labelText: widget.labelTitle,
// //                 hintStyle: getAppTextStyle(titleColor: ColorManager.hintColor,
// //                   titleSize: widget.hintFontSize,underline: false,),
// //                 labelStyle: getAppTextStyle(titleColor: ColorManager.hintColor,
// //                     titleSize: widget.hintFontSize,underline: false),
// //               // errorMaxLines: 1,
// //               errorStyle:  const TextStyle(fontSize:FontSize.s10)
// //             ),
// //             maxLength: widget.maxLength,
// //             textInputAction: widget.textInputAction,
// //
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// // }
//
