part of'widgetImports.dart';



class AdAImageWidget extends StatefulWidget {
  final XFile imageFile;
  final double? width,height;
  final Function() onRemove;

  const AdAImageWidget({super.key, required this.imageFile,required this.onRemove,this.width,this.height});

  @override
  State<AdAImageWidget> createState() => _AdAImageWidgetState();
}

class _AdAImageWidgetState extends State<AdAImageWidget> {
@override
Widget build(BuildContext context) {
  return   Container(
    width: widget.width??.5.sw,
    height: widget.height??145,
    // color: ColorManager.primary,
    child: Stack(
      children: [
        Container(
          margin: EdgeInsets.only(top: 5,left: 5,right: 5),
          width: .5.sw,
          // height: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(RadiusManager.r18),
            color: ColorManager.white,
            image: DecorationImage(
                image: FileImage(File(widget.imageFile.path)),
                fit: BoxFit.cover
          )
          ),

        ),

        InkWell(
          onTap: ()=>widget.onRemove(),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: ColorManager.grey,
            child:  Icon(Icons.close,
                size: AppSize.s16,
                color: ColorManager.white),
          ),
        ),
      ],
    ),
  );
}
}
