part of'widgets_imports.dart';


class DeleteChatWidget extends StatelessWidget {
 final String receiverName;
 final int receiverId;
  const DeleteChatWidget({super.key,required this.receiverName,required this.receiverId});

@override
Widget build(BuildContext context) {
  return Center(
      child: Material(
        borderRadius: BorderRadius.circular(RadiusManager.r20),
        child: Container(
          height: .5.sh,
          width: .9.sw,
          constraints: BoxConstraints(
            minHeight: .3.sh,
            maxHeight: .7.sh,
            minWidth: .9.sw,
            maxWidth: .9.sw,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageManager.deleteIcons,height: 140,fit: BoxFit.fill,),
              const AppSizeBox(height: 18,),
              AppText(title:'DeleteMessages'.tr().replaceFirst('person', receiverName),
                titleSize: FontSize.s18, titleAlign: TextAlign.center,
                titleColor: ColorManager.text,
                titleHeight: 1.3,
                fontWeightType: FontWeightType.semiBold,
                titleMaxLines: 3,),
              const AppSizeBox(height: 16,),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceAround,
             children: [
               MyTextButton(title: 'deleteConversation'.tr(),
                   size: Size( .4.sw,  47),
                   radius: 14,
                   fontWeightType: FontWeightType.bold,
                   titleSize: FontSize.s12,
                   primaryColor: ColorManager.primary,
                   titleColor: ColorManager.white,
                   onPressed: (){
                 Navigator.pop(context);
                 context.read<ChatAgreementDataProvider>().deleteMessagesInChatRoom(userId: Constants.userDataModel!.id, otherId: receiverId);
                   }),

               MyTextButton(title: 'Cancel'.tr(),
                   size: Size( .4.sw,  47),
                   radius: 14,
                   fontWeightType: FontWeightType.bold,
                   titleSize: FontSize.s12,
                   primaryColor: ColorManager.textGrey,
                   titleColor: ColorManager.black,
                   onPressed: (){
                     Navigator.pop(context);
                   }),
             ],
           )
            ],
          ),
        ),
      ));
}
}
