part of'widgets_imports.dart';


class EditPostWidget extends StatefulWidget {
  final  PostModel post;
  const EditPostWidget({super.key,required this.post});

  @override
  State<EditPostWidget> createState() => _EditPostWidgetState();
}

class _EditPostWidgetState extends State<EditPostWidget> {
  final formKey = GlobalKey<FormState>();
  TextEditingController postController = TextEditingController();
@override
  void initState() {
  super.initState();
  postController.text=widget.post.post;

  }
  @override
  void dispose() {
    postController.dispose();
    super.dispose();

  }



@override
Widget build(BuildContext context) {
  return Center(
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Material(
        borderRadius: BorderRadius.circular(RadiusManager.r14),
        color: ColorManager.white,
        child: Container(
            margin: const EdgeInsets.symmetric(vertical: 12,horizontal: 14),
            padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 4),
            width: 1.0.sw,
            constraints:  BoxConstraints(
                minHeight: 100,
                maxHeight: .7.sh
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(RadiusManager.r14),
              color: ColorManager.white,
            ),
            // height: 200,
            child:  Form(
              key: formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        title:'Edit'.tr(),
                        titleMaxLines: 1,
                        titleSize: FontSize.s16,
                        titleAlign: TextAlign.center,
                        titleColor: ColorManager.black,
                        fontWeightType: FontWeightType.medium,
                      ),
                    ],
                  ),

                  const AppSizeBox(height: AppSize.s20),


                  MoreLineTextFormField(
                      controller: postController,
                      hintTitle: 'Edit'.tr(),
                      labelTitle: 'Edit'.tr(),
                      textInputType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      hintFontSize: FontSize.s12,
                      hintStyle: getAppTextStyle(titleColor: ColorManager.textField, fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textStyle: getAppTextStyle(titleColor: ColorManager.icons,   fontWeightType: FontWeightType.medium,titleSize: FontSize.s12,underline: false),
                      textSize: FontSize.s12,
                      fillColor: ColorManager.textGrey,
                      borderColor: ColorManager.textGrey,
                      maxLines: 10,
                    validator: (v) => Validator().validateEmpty(value: v.toString(),),
                  ),
                  const AppSizeBox(height: AppSize.s20),
                  MyTextButton(title: 'send'.tr(),
                      size: Size( .5.sw,  40),
                      radius: 8,
                      fontWeightType: FontWeightType.medium,
                      titleSize: FontSize.s14,
                      primaryColor: ColorManager.primary,
                      titleColor: ColorManager.white,
                      onPressed: (){
                        Navigator.pop(context);
                        if(formKey.currentState!.validate()){
                          context.read<CouncilProvider>().editPost(context: context, postId: widget.post.id,
                          post: postController.text);
                        }

                      }),
                ],
              ),
            )
        ),
      ),
    ),
  );
}


}
