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
                  return RatingConsultantWidget(
                    comment:provider.allConsultantRates[index],
                    consultantId: provider.consultantInfo!.id,
                      consultantName: '${provider.consultantInfo!.firstName} ${provider.consultantInfo!.firstName}',
                  onTap: (comment){
                    LoadingDialog().widgetAlertDialog(context: context,
                        widget: AddReplyCommentToRateWidget(
                            rateId: comment.id,consultantId: provider.consultantInfo!.id,
                        onComment: (text){
                          context.read<ConsultantProvider>().addConsultantReplyRate(
                              context: context,
                              consultantId:provider.consultantInfo!.id,
                              rateId: comment.id,
                              comment: text);
                        },));
                  },);
                },
                childCount: provider.allConsultantRates.length,
              )));
  }
}
