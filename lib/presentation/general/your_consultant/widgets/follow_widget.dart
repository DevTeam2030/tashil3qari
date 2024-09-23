part of'widgets_imports.dart';

class FollowWidget extends StatelessWidget {
  final String title,value;
  final Function()? onTap;
  const FollowWidget({super.key,required this.title,required this.value,this.onTap});

@override
Widget build(BuildContext context) {
  return    Container(
    margin: const EdgeInsets.symmetric(vertical: 16),
    // padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
    width: 0.28.sw,
    height: 90,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(RadiusManager.r16),
      color: ColorManager.white,
      border: Border.all(color: ColorManager.textGrey,width: 1),
      // boxShadow: kElevationToShadow[4],
      // color: Theme.of(context).bottomAppBarColor,
    ),
    child: InkWell(
      onTap: (){
        if(onTap!=null) onTap!();
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(value.isNotEmpty)
            AppText(
                title: value,
                titleAlign: TextAlign.center,
                titleMaxLines: 1,fontWeightType: FontWeightType.extraBold,
                titleSize: FontSize.s14,titleColor: ColorManager.black),

          const AppSizeBox(height: 6,),
          AppText(
              title: title,
              titleAlign: TextAlign.center,
              titleMaxLines: 1,fontWeightType: FontWeightType.bold,
              titleSize: FontSize.s12,titleColor: ColorManager.black),
        ],
      ),
    )
  );
}
}
