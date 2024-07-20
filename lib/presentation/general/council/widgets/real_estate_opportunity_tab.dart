part of 'widgets_imports.dart';

class RealEstateOpportunityTab extends StatelessWidget {
  final CouncilData councilData;
  final   List<PostModel> data;
  final   bool isLoading ;
  const RealEstateOpportunityTab({super.key, required this.councilData,required this.data,required this.isLoading});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,
      child: Column(
        children: [
          const AppSizeBox(height: 14,),
          CityDropDown(
            selectedCity:councilData.selectedCity,
            cities: councilData.cities,
            onChanged: (v) {
              councilData.selectedCity = v!;
              context.read<CouncilProvider>().getCouncilData(context: context,notify: true,cityId: v.id);

            },
          ),

          if( data.isEmpty&&!isLoading)
          AppText(title:'NoDataCurrentlyAvailable'.tr(), titleSize: FontSize.s14,
            titleMaxLines: 14,
            titleHeight: 1.4,
            titleAlign: TextAlign.center,
            titleColor: ColorManager.titleServiceNameColor,
            fontWeightType: FontWeightType.bold,),
          Expanded(child:ListView.builder(
            itemCount:  data.length+1,
            itemBuilder: (context, index) =>
            index==0?AddRealEstateNews(councilData: councilData,isOpportunity: true,):
            RealEstateOpportunityItem(councilData:  councilData,opportunity: data[index-1]),),)

        ],
      ),
    );
  }
}
