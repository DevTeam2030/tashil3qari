part of'widgets_imports.dart';


class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String receiverName,receiverImage;
  final UserType receiverType;
  final int receiverId;
  final bool showAgreementButton;
  const ChatAppBar({
    Key? key,
    required this.receiverName,
    required this.receiverImage,
    required this.receiverType,
    required this.receiverId,
    required this.showAgreementButton,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12,right: 12,top: 30),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Row(
          children: [
            const BackAppBarButton(),

            // AppSizeBox(width: 4,),
            CachedImage(
              url:receiverImage,
              height: 50,
              width: 50,
              boxShape: BoxShape.circle,
              fit: BoxFit.cover,
            ),
            const AppSizeBox(width: AppSize.s4,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(title: receiverName,
                  titleSize:FontSize.s14,
                  titleMaxLines: 3,
                  titleHeight: 1.3,
                  titleAlign: TextAlign.start,
                  titleColor: ColorManager.icons,
                  fontWeightType: FontWeightType.bold,
                ),
                // AppText(title: receiverType==UserType.user?'user'.tr():'Real estate consultant'.tr(),
                //   titleSize:FontSize.s9,
                //   titleMaxLines: 3,
                //   titleHeight: 1.3,
                //   titleAlign: TextAlign.start,
                //   titleColor: ColorManager.icons,
                //   fontWeightType: FontWeightType.regular,
                // ),

              ],
            ),
          ],
        ),
          
         Row(
           mainAxisAlignment: MainAxisAlignment.end,
           children: [
             // Tooltip(
             //    message: 'agreement'.tr(),
             //   child: InkWell(
             //     onTap: ()=>MyRoute().navigate(context: context, route: MakeAgreementScreen(userId: receiverId,makeAgreement: true),),
             //     child: Icon(Icons.add_circle_outlined,color: ColorManager.primary,size: 30,),
             //   ),
             // ),


             if(showAgreementButton&&receiverId!=Constants.userDataModel!.id)
             SizedBox(
               height: 35,
               child: MyTextButton(title:'Make agreement'.tr(),
                   size: Size( .26.sw,  40),
                   radius: 10,
                   fontWeightType: FontWeightType.bold,
                   titleSize: FontSize.s12,
                   primaryColor: ColorManager.primary,
                   titleColor: ColorManager.white,
                   onPressed: ()async{

                     MyRoute().navigate(context: context, route: MakeAgreementScreen(receiverId: receiverId,
                       makeAgreementAction: MakeAgreementActon.create,
                     previousConsults: const [],
                     receiverName: receiverName,
                      receiverImage: receiverImage,
                     ),);
                   }),
             ),
             const AppSizeBox(width: AppSize.s14,),
             InkWell(
                 onTap: (){
                   LoadingDialog().widgetAlertDialog(context:context,
                       widget:  DeleteChatWidget(receiverName: receiverName,receiverId:receiverId,));
                 },
                 child: Icon(Icons.delete,color: ColorManager.red,size: 20,))
           ],
         )



        ],
      ),
    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(70);
}
