part of'widgets_imports.dart';

class YourConsultantCommentsTab extends StatelessWidget {
  final ConsultantProvider provider;
  const YourConsultantCommentsTab({super.key,required this.provider});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 20),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return RatingConsultantWidget(haveAnswer: index==0,);
                },
                childCount: 20,
                // childCount: provider.consultantsAds.length,
              )));
  }
}
