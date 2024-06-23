part of'widgetImports.dart';



class RequirementWidget extends StatefulWidget {
  final IconData firstIcon,secondIcon;
  final double? secondIconSize;
  final IconData? isOpenIcon;
  final String title;
  final Widget child;
  final Function? onTap;

  const RequirementWidget({super.key, this.isOpenIcon, this.secondIconSize, this.onTap,
    required this.firstIcon,required this.secondIcon,required this.title,required this.child});

  @override
  State<RequirementWidget> createState() => _RequirementWidgetState();
}

class _RequirementWidgetState extends State<RequirementWidget> {
  bool open=false;
@override
Widget build(BuildContext context) {
  return   AnimatedContainer (
    duration: const Duration (seconds: 1),
    margin: EdgeInsets.only(top: 20),
    padding: const EdgeInsets.symmetric(vertical: PaddingManager.p18,horizontal: PaddingManager.p16),
    width: 1.0.sw,
   // height: open?1.0.sh:100,
    // height: value?280:0,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(16),
      color: ColorManager.requirement,
      // boxShadow: Constants.kBoxShadow
    ),
    child: InkWell(
      onTap: (){
        if(widget.onTap!=null){
          widget.onTap!();
          return;
        }
        setState(() {
          open=!open;
        });
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const AppSizeBox(height: AppSize.s14,),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
           child: Row(
             children: [
               Container (
                 width: 50,
                 height: 50,
                 // padding: const EdgeInsets.all(12),
                 alignment: Alignment.center,
                 // height: value?280:0,
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(8),
                   color: ColorManager.white,
                   // boxShadow: Constants.kBoxShadow
                 ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   
                   children: [
                     Container (
                       // alignment: Alignment.center,
                       width: 32,
                       height: 32,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(3),
                         color: ColorManager.primary,
                         // boxShadow: Constants.kBoxShadow
                       ),
                       child: Icon(widget.firstIcon,color: ColorManager.white,),
                     ),
                   ],
                 ),

               ),
               const AppSizeBox(width: 10,),
               Expanded(
                 child: AppText(
                     title: widget.title,
                     titleHeight: 1.3,
                     titleAlign: TextAlign.start,
                     titleMaxLines: 2,fontWeightType: FontWeightType.medium,
                     titleSize: FontSize.s14,titleColor: ColorManager.black),
               ),

             ],
           ),
         ),

              const AppSizeBox(width: 10,),
              Container (
                width: 38,
                height: 38,
                alignment: Alignment.center,
                // height: value?280:0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorManager.white,
                  // boxShadow: Constants.kBoxShadow
                ),
                child: Icon(open&&widget.isOpenIcon!=null?widget.isOpenIcon:widget.secondIcon,
                  color: ColorManager.primary,size: widget.secondIconSize??20,),
              ),

            ],
          ),



          if(open)
            widget.child,
          // const AppSizeBox(height: AppSize.s14,),


        ],
      ),
    ),
  );
}
}
