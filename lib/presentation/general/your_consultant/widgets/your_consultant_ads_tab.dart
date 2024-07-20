part of'widgets_imports.dart';

class YourConsultantAdsTab extends StatelessWidget {
  final bool showAsList;
  final ConsultantProvider provider;
  const YourConsultantAdsTab({super.key,required this.showAsList,required this.provider});

  @override
  Widget build(BuildContext context) {
    return  showAsList?
      SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 14),
          sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return AdListItem(property: provider.consultantsAds[index],
                    onFavoriteTap: (property){
                      if(property.wishlist) {
                        provider.unWish(context: context, property: property);
                      } else {
                        provider.wish(context: context, property: property);
                      }
                    },);
                },
                childCount: provider.consultantsAds.length,
              ))):
      SliverPadding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        sliver:  SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 1,
            crossAxisSpacing: 2,
            childAspectRatio: .74,
          ),
          delegate: SliverChildBuilderDelegate(
                (context, index) {
              return AdGridItem(property: provider.consultantsAds[index],
                onFavoriteTap: (property){
                  if(property.wishlist) {
                    provider.unWish(context: context, property: property);
                  } else {
                    provider.wish(context: context, property: property);
                  }
                },);
            },
            // childCount:widget.cat.subCategories.length,
            childCount: provider.consultantsAds.length,
          ),
        ),);
  }
}
