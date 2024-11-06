part of'widgets_imports.dart';


class BidWidget extends StatefulWidget {
  final BidData bidData;
  final bool isBidBefore;
  final int propertyId;
  final   AuctionDataModel auctionData;
 final AuctionUserModel? mostAuctionUser;
  const BidWidget({super.key,required this.bidData,required this.auctionData,required this.mostAuctionUser,
  required this.isBidBefore,required this.propertyId}) ;

  @override
  State<BidWidget> createState() => _BidWidgetState();
}

class _BidWidgetState extends State<BidWidget> {
  @override
  Widget build(BuildContext context) {


    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Form(
        key: widget.bidData.formKey,
        child: Column(
          children: [
            const AppSizeBox(height: 24,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                   CircleAvatar(
                     radius: 10,
                     backgroundColor: ColorManager.green.withOpacity(.3),
                     child: const CircleAvatar(
                       radius: 6,
                       backgroundColor: ColorManager.green,
                     )
                   ),
                    const AppSizeBox(width: 4,),
                    AppText(
                      title:'Bids'.tr(),
                      titleMaxLines: 2,
                      titleHeight: 1.3,
                      titleSize: FontSize.s14,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.extraBold,
                    ),
                  ],
                ),

                AppText(
                  title:' ${widget.auctionData.auctionsUsers.length} ${'people bid'.tr()}',
                  titleMaxLines: 2,
                  titleHeight: 1.3,
                  titleSize: FontSize.s12,
                  titleAlign: TextAlign.end,
                  titleColor: ColorManager.black,
                ),
              ],
            ),

              const AppSizeBox(height: 4,),

            if(widget.mostAuctionUser!=null)BidPersonWidget(isWin: true,user: widget.mostAuctionUser!,
            propertyId: widget.propertyId,),

            for(var item in widget.auctionData.auctionsUsers.where((element) => element!=widget.mostAuctionUser))
             BidPersonWidget(isWin: false,user: item,propertyId: widget.propertyId,),

            const AppSizeBox(height: 10,),

            if(Constants.userDataModel!=null&&widget.auctionData.userId!=Constants.userDataModel!.id&&widget.auctionData.isLive)
              // widget.isBidBefore? Padding(
              //   padding: const EdgeInsets.only(top: 20),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       AppText(
              //         title:'IsBidBefore'.tr(),
              //         titleMaxLines: 2,
              //         titleHeight: 1.3,
              //         titleSize: FontSize.s16,
              //         titleAlign: TextAlign.center,
              //         titleColor: ColorManager.red,
              //       ),
              //     ],
              //   ),
              // ):
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    AppText(
                      title:'Please enter bid value'.tr(),
                      titleMaxLines: 2,
                      titleHeight: 1.3,
                      titleSize: FontSize.s12,
                      titleAlign: TextAlign.start,
                      titleColor: ColorManager.black,
                      fontWeightType: FontWeightType.medium,
                    ),
                    const AppSizeBox(width: 4,),
                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                            bottomLeft: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                            topRight: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                            bottomRight: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                          ),
                          border: Border.all(color: ColorManager.black,width: 1)
                      ),
                      child: Icon(Icons.add,color: ColorManager.black,size: 20,),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        height: 30,
                        child: DefaultTextFormField(
                          controller: widget.bidData.priceController,
                          hintTitle: 'Bid value'.tr(),
                          labelTitle: 'Bid value'.tr(),
                          textInputAction: TextInputAction.next,
                          textInputType: TextInputType.number,
                          hintFontSize: FontSize.s12,
                          hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                          textSize: FontSize.s12,
                          fillColor: ColorManager.white,
                          borderColor: ColorManager.black,
                          borderRadius: 0,
                          onChanged: (v){
                            setState(() {});
                          },
                          validator: (v) => Validator().validatePrice(value: v.toString(),),
                        ),
                      ),
                    ),

                    Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                            bottomLeft: Constants.isArabic?const Radius.circular(10):const Radius.circular(0),
                            topRight: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                            bottomRight: Constants.isArabic?const Radius.circular(0):const Radius.circular(10),
                          ),
                          border: Border.all(color: ColorManager.black,width: 1)
                      ),
                      child: Icon(Icons.remove,color: ColorManager.black,size: 20,),
                    ),

                  ],
                ),

                Padding(
                    padding:const EdgeInsets.only(top:18.0),
                    child: AppText(
                        title: 'currencyMessage2'.tr().replaceFirst('c', widget.auctionData.currency) ,
                        titleAlign: TextAlign.center,
                        titleMaxLines: 1,fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s12,
                        titleColor: ColorManager.icons3)),
                const AppSizeBox(height: 20,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MyTextButton(
                        title: '${'Confirm  bid of'.tr()} ${widget.bidData.priceController.text} ${widget.auctionData.currency}',
                        size: Size( 0.8.sw,  60),
                        radius: 14,
                        fontWeightType: FontWeightType.medium,
                        titleSize: FontSize.s12,
                        primaryColor: ColorManager.primary,
                        titleColor: ColorManager.white,
                        borderColor: ColorManager.primary,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                            CircleAvatar(
                              radius: 14,
                              backgroundColor: ColorManager.white,
                              child: CircleAvatar(
                                radius: 12,
                                backgroundColor: ColorManager.primary,
                                child: SvgPicture.asset(ImageManager.applyAuctions),
                              ),
                            ),

                            const AppSizeBox(width: 4,),
                            Flexible(child: AppText(
                              title: 'Confirm  bid of'.tr() +' ${widget.bidData.priceController.text} ${widget.auctionData.currency}',
                              titleMaxLines: 4,
                              titleHeight: 1.6,
                              titleSize: FontSize.s16,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.white,
                              fontWeightType: FontWeightType.medium,
                            ),)
                          ],
                        ),
                        onPressed: (){
                          if(!widget.bidData.formKey.currentState!.validate()) return;
                          double adPrice=double.tryParse(widget.auctionData.minimumAuction)??0;
                          double value=double.tryParse(widget.bidData.priceController.text)??0;
                          if(value<adPrice){
                            LoadingDialog.showSimpleToast('currencyMessage3'.tr());
                            return;
                          }
                          LoadingDialog().optionalAlertDialog(context:context,
                              message: 'Confirm  bid of'.tr() +' ${widget.bidData.priceController.text} ${widget.auctionData.currency}',
                              title:'areYouSure'.tr(),
                              okClick: (){
                                Navigator.pop(context);
                                widget.bidData.addAuction(context: context,price: widget.bidData.priceController.text,
                                    currencyId: widget.auctionData.currencyId);
                              });
                        }),
                  ],
                ),
              ],
            ),





            const AppSizeBox(height: 20,)
          ],
        ),
      ),
    );
  }
}
