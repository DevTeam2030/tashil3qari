part of 'widgets_imports.dart';

class RealEstateNewsTab extends StatefulWidget {
  final CouncilData councilData;
  final   List<PostModel> data;
  const RealEstateNewsTab({super.key, required this.councilData,required this.data});

  @override
  State<RealEstateNewsTab> createState() => _RealEstateNewsTabState();
}

class _RealEstateNewsTabState extends State<RealEstateNewsTab> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,
      child: ListView.builder(
        itemCount: widget.data.length+1,
        itemBuilder: (context, index) =>
            index==0?AddRealEstateNews(councilData: widget.councilData,):
            RealEstateNewsItem(councilData: widget.councilData,post: widget.data[index-1]),),
    );
  }
}
