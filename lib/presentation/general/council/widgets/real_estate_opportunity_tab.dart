part of 'widgets_imports.dart';

class RealEstateOpportunityTab extends StatelessWidget {
  final CouncilData councilData;
  final   List<PostModel> data;
  const RealEstateOpportunityTab({super.key, required this.councilData,required this.data});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,
      child: ListView.builder(
        itemCount:  data.length+1,
        itemBuilder: (context, index) =>
            index==0?AddRealEstateNews(councilData: councilData,isOpportunity: true,):
            RealEstateOpportunityItem(councilData:  councilData,opportunity: data[index-1]),),
    );
  }
}
