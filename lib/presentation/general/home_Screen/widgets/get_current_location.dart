part of'widget_imports.dart';




class GetCurrentLocationWidget extends StatelessWidget {
  final Function() onTap;
  const GetCurrentLocationWidget({super.key,required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:Constants.isArabic? Alignment.bottomRight:Alignment.bottomLeft,
      child: Container(
        width: 50,
        height: 50,
        
        decoration: Utils.returnDropdownButtonDecoration(ColorManager.white,
          ColorManager.white,18),
        margin:  const EdgeInsets.only(bottom: 120,right: 10,left: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: InkWell(
          splashColor: ColorManager.white,
          highlightColor:ColorManager.white ,
          onTap: ()=>onTap() ,
          child:const Icon(Icons.gps_fixed_outlined,color: ColorManager.text,)
        ),
      ),
    );
  }
}

