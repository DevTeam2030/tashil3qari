part of'widget_imports.dart';


class SearchSelectLocationButton extends StatelessWidget {
  final CountryModel selectedCountry;
  final CityModel selectedCity;
  final Function(CountryModel,CityModel,LatLng?) onTap;
  const SearchSelectLocationButton({super.key,required this.selectedCountry,required this.selectedCity,required this.onTap});

@override
Widget build(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: PaddingManager.p8),
            child: AppText(
              title: 'Region'.tr(),
              titleSize: FontSize.s14,
              titleAlign: TextAlign.start,
              titleColor: ColorManager.black,
              fontWeightType: FontWeightType.medium,
            ),
          ),
        ],
      ),
      const AppSizeBox(
          height: 8
      ),
      Container(
        padding: const EdgeInsets.symmetric(vertical: PaddingManager.p10, horizontal: PaddingManager.p16),
        width: 1.0.sw,
        // height: value ? 280 : 45,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(RadiusManager.r12),
          border: Border.all(color: ColorManager.grey, width: 1),
          color: ColorManager.textGrey,
          // boxShadow: Constants.kBoxShadow
        ),
        child: InkWell(
          onTap: () {
            MyRoute().navigate(context: context, route:  SearchLocationScreen(onTap: onTap,));
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: ColorManager.icons,
                    size: 16,
                  ),
                  AppSizeBox(
                    width: 4,
                  ),
                  AppText(
                    title: '${selectedCity.name}',
                    // title: '${selectedCountry.name} , ${selectedCity.name}',
                    titleSize: FontSize.s14,
                    titleAlign: TextAlign.start,
                    titleHeight: 1.4,
                    titleMaxLines: 4,
                    titleColor: ColorManager.black,
                    fontWeightType: FontWeightType.medium,
                  ),
                ],
              ),

              AppText(
                title: 'otherPlace'.tr(),
                titleSize: FontSize.s14,
                titleAlign: TextAlign.start,
                titleHeight: 1.4,
                titleMaxLines: 4,
                titleColor: ColorManager.primary,
                fontWeightType: FontWeightType.medium,
              ),
            ],
          ),
        ),
      ),


    ],
  );
}
}
