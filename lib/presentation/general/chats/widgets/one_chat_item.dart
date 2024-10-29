part of'widgets_imports.dart';
class OneChatItem extends StatefulWidget {
  final ChatMessageModel messageModel;
  final Function() onTap;
  // final int index;
  const OneChatItem({Key? key,required this.messageModel,required this.onTap}) : super(key: key);

  @override
  State<OneChatItem> createState() => _OneChatItemState();
}

class _OneChatItemState extends State<OneChatItem> {
  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // ChatMessageModel messageModel=ChatMessageModel.fromJson(data);
    bool meSender = widget.messageModel.senderId== Constants.userDataModel!.id;
    DateTime messageDate=widget.messageModel.timestamp.toDate();
    DateTime date=DateTime.now();
    int unreadMessages=!meSender?widget.messageModel.receiverUnreadMessage:widget.messageModel.senderUnreadMessage;
    // Map<String, dynamic> data = document.data() as Map<String, dynamic>;
    // bool isSender = data['senderId'] == Constants.userDataModel!.image;
    // ValueKey key=ValueKey<int>(0);
    return Stack(
      fit:  StackFit.loose,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p16, vertical: PaddingManager.p8),
          margin: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            color: ColorManager.textGrey,
            borderRadius: BorderRadius.circular(AppSize.s20),

          ),
          child: InkWell(
            onTap: (){
             widget.onTap();
            },
            child:Row(
              children: [
                CachedImage(
                  url:meSender?widget.messageModel.receiverImage:widget.messageModel.senderImage,
                  height: 60,width: 60,
                  boxShape: BoxShape.circle,
                  fit: BoxFit.cover,
                ),
                const AppSizeBox(width: AppSize.s12,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(title:meSender?widget.messageModel.receiverName:widget.messageModel.senderName,
                        titleSize:FontSize.s14,
                        titleMaxLines: 3,
                        titleHeight: 1.3,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.icons,
                        fontWeightType: FontWeightType.bold,
                      ),
                      // AppSizeBox(height: 4,),
                      // AppText(title:'(${meSender?
                      // messageModel.receiverType=='normal'?'user'.tr():'Real estate consultant'.tr():
                      // messageModel.senderType=='normal'?'user'.tr():'Real estate consultant'.tr()})',
                      //   titleSize:FontSize.s12,
                      //   titleMaxLines: 3,
                      //   titleHeight: 1.3,
                      //   titleAlign: TextAlign.start,
                      //   titleColor: ColorManager.icons,
                      //   fontWeightType: FontWeightType.regular,
                      // ),
                      AppSizeBox(height: 4,),


                     Row(
                       children: [
                         if(widget.messageModel.messageType=='pdf')Image.asset(ImageManager.pdfPng,height: 22,width: 22,),
                         Flexible(
                           child: AppText(
                             // title: messageModel.message,
                             title: widget.messageModel.messageType=='pdf'?'pdfFile'.tr():widget.messageModel.message,
                              titleSize:FontSize.s12,
                              titleMaxLines: 3,
                              titleHeight: 1.3,
                              titleAlign: TextAlign.start,
                              titleColor: ColorManager.icons,
                              fontWeightType: FontWeightType.regular,
                            ),
                         ),
                       ],
                     ),

                      // AppText(title:'${messageDate.year}/${messageDate.month}/${messageDate.day}',
                      //   titleSize:FontSize.s12,
                      //   titleMaxLines: 3,
                      //   titleHeight: 1.3,
                      //   titleAlign: TextAlign.start,
                      //   titleColor: ColorManager.icons,
                      //   fontWeightType: FontWeightType.regular,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     AppText(title:messageDate.year==date.year&&messageDate.month==date.month&&messageDate.day==date.day?
                      //         '${messageDate.hour}:${messageDate.minute}':'${messageDate.year}/${messageDate.month}/${messageDate.day}',
                      //       titleSize:FontSize.s12,
                      //       titleMaxLines: 3,
                      //       titleHeight: 1.3,
                      //       titleAlign: TextAlign.end,
                      //       titleColor: ColorManager.icons,
                      //       fontWeightType: FontWeightType.regular,
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
                const AppSizeBox(width: AppSize.s12,),
                // AppText(title: '${messageDate.hour}:${messageDate.minute}',
                //   titleSize:FontSize.s12,
                //   titleMaxLines: 3,
                //   titleHeight: 1.3,
                //   titleAlign: TextAlign.end,
                //   titleColor: ColorManager.icons,
                //   fontWeightType: FontWeightType.regular,
                // ),

                AppText(title:messageDate.year==date.year&&messageDate.month==date.month&&messageDate.day==date.day?
                '${messageDate.hour}:${messageDate.minute}':'${messageDate.year}/${messageDate.month}/${messageDate.day}',
                  titleSize:FontSize.s12,
                  titleMaxLines: 3,
                  titleHeight: 1.3,
                  titleAlign: TextAlign.end,
                  titleColor: ColorManager.icons,
                  fontWeightType: FontWeightType.regular,
                ),

              ],
            ),
            // child:SwipeActionCell(
            //   backgroundColor: ColorManager.textGrey,
            //   key: ObjectKey(int), /// this key is necessary
            //   leadingActions: <SwipeAction>[
            //     SwipeAction(
            //         // title: "delete",
            //         onTap: (CompletionHandler handler) async {
            //           // list.removeAt(index);
            //           // setState(() {});
            //         },
            //         backgroundRadius: 20,
            //
            //         icon: Icon(Icons.delete,color: ColorManager.white),
            //         // backgroundRadius: 20,
            //         color:  ColorManager.primary),
            //   ],
            //   child:  Row(
            //     children: [
            //       CachedImage(
            //         url:meSender?messageModel.receiverImage:messageModel.senderImage,
            //         height: 60,width: 60,
            //         boxShape: BoxShape.circle,
            //         fit: BoxFit.cover,
            //       ),
            //       const AppSizeBox(width: AppSize.s12,),
            //       Column(
            //         crossAxisAlignment: CrossAxisAlignment.start,
            //         children: [
            //           Row(
            //             children: [
            //               AppText(title:meSender?messageModel.receiverName:messageModel.senderName,
            //                 titleSize:FontSize.s14,
            //                 titleMaxLines: 3,
            //                 titleHeight: 1.3,
            //                 titleAlign: TextAlign.start,
            //                 titleColor: ColorManager.icons,
            //                 fontWeightType: FontWeightType.bold,
            //               ),
            //               AppText(title:'(${meSender?
            //               messageModel.receiverType=='normal'?'user'.tr():'Real estate consultant'.tr():
            //               messageModel.senderType=='normal'?'user'.tr():'Real estate consultant'.tr()})',
            //                 titleSize:FontSize.s12,
            //                 titleMaxLines: 3,
            //                 titleHeight: 1.3,
            //                 titleAlign: TextAlign.start,
            //                 titleColor: ColorManager.icons,
            //                 fontWeightType: FontWeightType.regular,
            //               ),
            //             ],
            //           ),
            //           AppSizeBox(height: 4,),
            //           AppText(title: messageModel.message,
            //             titleSize:FontSize.s12,
            //             titleMaxLines: 3,
            //             titleHeight: 1.3,
            //             titleAlign: TextAlign.start,
            //             titleColor: ColorManager.icons,
            //             fontWeightType: FontWeightType.regular,
            //           ),
            //
            //           // AppText(title:'${messageDate.year}/${messageDate.month}/${messageDate.day}',
            //           //   titleSize:FontSize.s12,
            //           //   titleMaxLines: 3,
            //           //   titleHeight: 1.3,
            //           //   titleAlign: TextAlign.start,
            //           //   titleColor: ColorManager.icons,
            //           //   fontWeightType: FontWeightType.regular,
            //           // ),
            //           // Row(
            //           //   mainAxisAlignment: MainAxisAlignment.end,
            //           //   children: [
            //           //     AppText(title:messageDate.year==date.year&&messageDate.month==date.month&&messageDate.day==date.day?
            //           //         '${messageDate.hour}:${messageDate.minute}':'${messageDate.year}/${messageDate.month}/${messageDate.day}',
            //           //       titleSize:FontSize.s12,
            //           //       titleMaxLines: 3,
            //           //       titleHeight: 1.3,
            //           //       titleAlign: TextAlign.end,
            //           //       titleColor: ColorManager.icons,
            //           //       fontWeightType: FontWeightType.regular,
            //           //     ),
            //           //   ],
            //           // ),
            //         ],
            //       ),
            //       const AppSizeBox(width: AppSize.s12,),
            //       // AppText(title: '${messageDate.hour}:${messageDate.minute}',
            //       //   titleSize:FontSize.s12,
            //       //   titleMaxLines: 3,
            //       //   titleHeight: 1.3,
            //       //   titleAlign: TextAlign.end,
            //       //   titleColor: ColorManager.icons,
            //       //   fontWeightType: FontWeightType.regular,
            //       // ),
            //
            //       AppText(title:messageDate.year==date.year&&messageDate.month==date.month&&messageDate.day==date.day?
            //       '${messageDate.hour}:${messageDate.minute}':'${messageDate.year}/${messageDate.month}/${messageDate.day}',
            //         titleSize:FontSize.s12,
            //         titleMaxLines: 3,
            //         titleHeight: 1.3,
            //         titleAlign: TextAlign.end,
            //         titleColor: ColorManager.icons,
            //         fontWeightType: FontWeightType.regular,
            //       ),
            //
            //     ],
            //   ),
            // )


          ),
        ),

        if(unreadMessages>0)
        Align(
          child:
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 14,horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  radius: 8,
                  backgroundColor: ColorManager.red,
                  child:  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top:3),
                      child:AppText(title:unreadMessages.toString(),
                        titleSize:FontSize.s10,
                        // titleMaxLines: 10,
                        // titleHeight: 1.3,
                        titleAlign: TextAlign.start,
                        titleColor: ColorManager.white,
                        fontWeightType: FontWeightType.regular,
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        )

      ],
    );
  }
}


