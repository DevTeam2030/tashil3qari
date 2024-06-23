part of'widgets_imports.dart';


class AcceptRejectAd extends StatelessWidget {
  final int propertyId ;
  final int notificationId; //coming from notification to accept or refuse ad
  const AcceptRejectAd({super.key,required this.propertyId,required this.notificationId});

  @override
  Widget build(BuildContext context) {
    return         Padding(
      padding: const EdgeInsets.symmetric(vertical:20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          MyTextButton(title: 'Accept'.tr(),
              size: Size( .42.sw,  35),
              fontWeightType: FontWeightType.regular,
              titleSize: FontSize.s14,
              radius: RadiusManager.r6,
              primaryColor: ColorManager.primary,
              titleColor: ColorManager.white,
              onPressed: ()async{
               await context.read<NotificationsProvider>().acceptProperty(
                    context: context,
                    notificationId: notificationId,
                    propertyId: propertyId,
                );
               Navigator.pop(context);
              }),

          const AppSizeBox(width: 6,),
          MyTextButton(title: 'reject'.tr(),
              size: Size( .42.sw,  35),
              fontWeightType: FontWeightType.regular,
              titleSize: FontSize.s14,
              radius: RadiusManager.r6,
              primaryColor: ColorManager.red,
              titleColor: ColorManager.white,
              onPressed: ()async{
                await context.read<NotificationsProvider>().refuseProperty(
                    context: context,
                    notificationId: notificationId,
                    propertyId: propertyId);
                Navigator.pop(context);
              }),
        ],
      ),
    );
  }
}
