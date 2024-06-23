
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:dio/dio.dart';
import 'package:image/image.dart' as img;

Future<Uint8List?> loadImageFromUrl(String imageUrl) async {
  int imageWidth=200;
  int imageHeight=200;
  try {
    Response<List<int>> response = await Dio().get<List<int>>(
      imageUrl,
      options: Options(responseType: ResponseType.bytes,),
    );
    // Uint8List? bytes = Uint8List.fromList(response.data!);
    //
    // if(bytes==null)return null;
    // // Decode the image to get its size
    // ui.Codec codec = await ui.instantiateImageCodec(bytes);
    // ui.FrameInfo frameInfo = await codec.getNextFrame();
    // int imageWidth = frameInfo.image.width;
    // int imageHeight = frameInfo.image.height;
    //
    // // Resize the image if necessary
    // if (imageWidth>30 || imageHeight>30) {
    //   ui.Image? resizedImage = await frameInfo.image.toByteData(
    //     format: ui.ImageByteFormat.png,
    //   ).then((ByteData? byteData) async{
    //     Uint8List pixels=await byteData!.buffer.asUint8List();
    //     return ui.decodeImageFromPixels(
    //         pixels,
    //       // width.toInt(),
    //       // height.toInt(),
    //       // allowUpscaling: true,
    //     );
    //   });
    //
    //   // Convert the resized image to bytes
    //   ByteData? resizedByteData = await resizedImage?.toByteData(format: ui.ImageByteFormat.png);
    //   return resizedByteData==null?Uint8List.fromList(response.data!): Uint8List.view(resizedByteData.buffer);
    // }
    Uint8List bytes = Uint8List.fromList(response.data!);

    // Resize the image if necessary

      img.Image? originalImage = img.decodeImage(bytes);
      img.Image? resizedImage = img.copyResize(originalImage!, width: imageWidth, height: imageHeight);

    // Convert the resized image to bytes
    List<int> resizedByteData = img.encodePng(resizedImage); // or img.encodeJpg(resizedImage, quality: 85) for JPEG format
    return Uint8List.fromList(resizedByteData);



    return Uint8List.fromList(response.data!,);
  } catch (error) {
    print('Error loading image: $error');
    return null;
  }
}