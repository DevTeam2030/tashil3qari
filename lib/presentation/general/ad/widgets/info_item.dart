part of'widgets_imports.dart';


class InformationsItem extends StatelessWidget {
  final String title,value ;
  final Color color ;
  final bool isLAst ;
  const InformationsItem({super.key,required this.title,required this.value,required this.color,this.isLAst=false});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14,vertical: 10),
      width: 1.0.sw,
      decoration: BoxDecoration(
        // color: color,
        border: Border(
          bottom: BorderSide(
            color: isLAst?ColorManager.white:ColorManager.textGrey,
            width: 1,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: AppText(
              title:title,
              titleMaxLines: 2,
              titleHeight: 1.3,
              titleSize: FontSize.s16,
              titleAlign: TextAlign.start,
              titleColor: ColorManager.icons,
              fontWeightType: FontWeightType.regular,
            ),
          ),

          Expanded(
            flex: 2,
            child: AppText(
              title:value,
              titleMaxLines: 2,
              titleHeight: 1.3,
              titleSize: FontSize.s16,
              titleAlign: TextAlign.start,
              titleColor: ColorManager.black,
              fontWeightType: FontWeightType.medium,
            ),
          ),

        ],
      ),
    );
  }
}
