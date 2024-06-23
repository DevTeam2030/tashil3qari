part of'widgets_imports.dart';


class AddImageSquare extends StatelessWidget {
  final String image ;
  final Widget? childStack ;
  final Function() onTap;
  const AddImageSquare({super.key,required this.image,required this.onTap,this.childStack});

  @override
  Widget build(BuildContext context) {

    return    Padding(
      padding: const EdgeInsets.only(bottom: 6),
      child: InkWell(
        onTap: ()=>onTap(),
        child:SizedBox(
          width: 45,
          height: 45,
          child: Stack(
            children: [
              CachedImage(
                url: image,
                width: 45,
                height: 45,
                borderRadius:  BorderRadius.circular(RadiusManager.r8),
                border: Border.all(color: ColorManager.white,width: 3),
                fit: BoxFit.cover,
              ),

              if(childStack!=null)childStack!
            ],
          ),
        ),
      ),
    );
  }
}
