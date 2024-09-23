part of 'widgets_imports.dart';

class FollowingUserWidgets extends StatelessWidget {
  final FollowingUserModel user;
  const FollowingUserWidgets({super.key, required this.user});


  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4,horizontal: 4),
      padding: const EdgeInsets.symmetric(vertical: 12,horizontal: 8),
      width: 1.0.sw,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(RadiusManager.r14),
        color: ColorManager.textGrey,
      ),
      height: 130,
      child:     Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          CachedImage(
            url:user.image,
            height: 80.0,
            width: 80.0,
            fit: BoxFit.cover,
            boxShape: BoxShape.circle,
          ),

          const AppSizeBox(height: 14,),
          Expanded(
            child: AppText(
                title:user.name,
                titleAlign: TextAlign.center,
                titleHeight: 1.5,
                titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                titleSize: FontSize.s12,titleColor: ColorManager.black),
          ),






        ],
      ),
    );


  }
}
