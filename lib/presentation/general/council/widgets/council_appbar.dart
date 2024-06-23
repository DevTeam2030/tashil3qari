part of 'widgets_imports.dart';


class CouncilBuildAppBar extends StatelessWidget implements PreferredSizeWidget {
  final CouncilData councilData;
  final bool? showFilter;
  final double? fromHeight;
  const CouncilBuildAppBar({
    Key? key,
    required this.councilData,
    this.showFilter,
    this.fromHeight,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [


        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AppText(title:'${'hi'.tr()} ${Constants.userDataModel!.firstName} ${Constants.userDataModel!.lastName}',
                    titleSize: FontSize.s20,
                    titleMaxLines: 2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.icons,
                    fontWeightType: FontWeightType.extraBold,),

                  AppText(title:'Real estate consultant'.tr(),
                    titleSize: FontSize.s11,
                    titleMaxLines: 2,
                    titleAlign: TextAlign.start,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.medium,),
                ],
              ),


              // ignore: prefer_const_constructors
              ChatNotifyIcon(),


            ],
          ),
        ),

        // const Divider(color: ColorManager.divider,thickness: 1.2),
        //
        //
        // AppSizeBox(height: 4,)


      ],



    );
  }

  @override
  Size get preferredSize =>  Size.fromHeight(fromHeight??110);
}
