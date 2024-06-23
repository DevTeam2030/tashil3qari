part of'widgets_imports.dart';


class PhotoViewWidget extends StatelessWidget {
  final String image;
  const PhotoViewWidget({super.key,required this.image});

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      height: 1.0.sh,
      width: 1.0.sw,

      child: PhotoView(
        imageProvider: NetworkImage(image),
        minScale: PhotoViewComputedScale.contained * 0.8,
        maxScale: PhotoViewComputedScale.covered * 1.8,
        initialScale: PhotoViewComputedScale.covered * 1.0,
        backgroundDecoration: BoxDecoration(
          color: Colors.white,
        ),
        loadingBuilder: (context, event) => Center(
          child: Container(
            width: 20.0.w,
            height: 20.0.w,
            child: CircularProgressIndicator(
              value: event == null
                  ? 0
                  : event.cumulativeBytesLoaded / event.expectedTotalBytes!,
            ),
          ),
        ),
      ),
    );
  }
}
