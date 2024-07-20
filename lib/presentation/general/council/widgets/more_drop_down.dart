part of 'widgets_imports.dart';

class MoreCounilDropdownButton extends StatefulWidget {
  final CouncilData councilData;
  final  PostModel post;
  final  bool isPost;
  const MoreCounilDropdownButton({super.key, required this.councilData, required this.post, required this.isPost});


  @override
  State<MoreCounilDropdownButton> createState() => _MoreCounilDropdownButtonState();
}

class _MoreCounilDropdownButtonState extends State<MoreCounilDropdownButton> {
  String? selectedFilter;
   List<String> filters=[];
  @override
  void initState() {
    super.initState();
  }
double width=120.0;
  @override
  Widget build(BuildContext context) {
    filters=[];
    // if(!widget.isPost&&widget.post.isAgreement)filters.add('AddConsultantToAgreement'.tr());
    widget.post.userId!=Constants.userDataModel!.id?
    filters.addAll([
      // widget.post.isFollow?'unfollow'.tr():'Follow'.tr(),'Hide'.tr(),''
          'Report'.tr()
    ]):
    filters.add('Delete'.tr(),);
    if(widget.post.userId==Constants.userDataModel!.id&&widget.isPost) filters.add('Edit'.tr(),);
    

    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        // isExpanded: true,
        isDense: false,
        value: selectedFilter,
        underline: const AppSizeBox(height: 0),
        hint:   null,
        customButton: const Padding(
          padding: EdgeInsets.only(bottom: 14),
          child: CircleAvatar(
              radius: 16,
              backgroundColor: ColorManager.textGrey,
              child: Icon(Icons.more_horiz,size: 20,color: ColorManager.grey1,)),
        ),
        items: filters
            .map((String filter) => DropdownMenuItem<String>(
          value: filter,
          child:  AppText(
              title: filter,
              titleAlign: TextAlign.start,
              titleMaxLines: 2,fontWeightType: FontWeightType.medium,
              titleSize: FontSize.s12,
              titleColor:filter==filters.last ?ColorManager.red:ColorManager.black)
        ))
            .toList(),
        onChanged: (value) {

          if(value=='unfollow'.tr()||value=='Follow'.tr()) {
            context.read<CouncilProvider>().followOrUnfollowConsultant(context: context,
              post: widget.post,isPost:widget.isPost );
          }
          else if(value=='Hide'.tr()) {
            context.read<CouncilProvider>().hidePostOrOpportunity(context: context,
                postId: widget.post.id, isPost: widget.isPost);
          }
          else if(value=='Report'.tr()) {
            LoadingDialog().widgetAlertDialog(context: context, widget: ReportWidget(consultantId: widget.post.userId,));
            // context.read<CouncilProvider>().reportConsultant(context: context, consultantId: widget.post.userId, );
          }

          else if(value=='Delete'.tr()) {
            context.read<CouncilProvider>().deletePostOrOpportunity(context: context,
                postId: widget.post.id, isPost: widget.isPost);
          }
          else if(value=='Edit'.tr()) {
            LoadingDialog().widgetAlertDialog(context: context, widget: EditPostWidget(post: widget.post,councilData: widget.councilData),);
         
          }
          else if(value=='AddConsultantToAgreement'.tr()) {
            MyRoute().navigate(context: context, route: AddAgreementConsultantScreen(opportunity: widget.post,));
          }
          else{}


        },
        buttonStyleData: const ButtonStyleData(
          height: 30,
          width: 30,
          // padding: const EdgeInsets.only(left: 5, right: 5),
          decoration: BoxDecoration(
            color:ColorManager.textGrey,
              shape: BoxShape.circle
          ),
          // elevation: 2,
        ),

        iconStyleData:  const IconStyleData(
          icon:Center(
            child: Icon(Icons.more_horiz,
              color: ColorManager.grey1,size: AppSize.s20,),
          ),
          iconSize: 14,
          iconEnabledColor: Colors.yellow,
          iconDisabledColor: Colors.grey,
        ),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 140,
          width: width,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: ColorManager.white,
          ),
          offset: const Offset(100, 10),
          scrollbarTheme: ScrollbarThemeData(
            thumbColor: MaterialStateProperty.all(ColorManager.primary),
            radius: const Radius.circular(40),
            thickness: MaterialStateProperty.all(3),
            thumbVisibility: MaterialStateProperty.all(true),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          height: 30,
          // padding: EdgeInsets.only(left: 6, right: 6),
        ),
      ),
    );


  }
}
