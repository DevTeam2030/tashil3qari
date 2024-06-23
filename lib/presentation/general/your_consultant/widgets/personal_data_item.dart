part of'widgets_imports.dart';

class PersonalDataItem extends StatelessWidget {
  final String title,value;
  const PersonalDataItem({super.key,required this.title,required this.value});

@override
Widget build(BuildContext context) {
  return   Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        AppText(
            title: title,
            titleAlign: TextAlign.start,
            titleMaxLines: 1,fontWeightType: FontWeightType.medium,
            titleSize: FontSize.s14,titleColor: ColorManager.black),

        const AppSizeBox(height: 12),
        Material(
          elevation: 1,
          color: ColorManager.white,
          borderRadius: BorderRadius.circular(10),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal:12.0,vertical: 10),
            width: 1.0.sw,
            child: AppText(
                title: value,
                titleAlign: TextAlign.start,
                titleHeight: 1.4,
                titleMaxLines: 10,fontWeightType: FontWeightType.regular,
                titleSize: FontSize.s12,titleColor: ColorManager.black),
          ),
        )

      ],
    ),
  );
}
}
