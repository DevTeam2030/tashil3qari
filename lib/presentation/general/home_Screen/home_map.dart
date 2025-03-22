// import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:latlong2/latlong.dart';
// import 'package:provider/provider.dart';
//
// import '../../../providers/general_provider.dart';
// import '../../../providers/home_provider.dart';
// import 'home_imports.dart';
//
// class SaudiOnlyMap extends StatelessWidget {
//   final List<City> cities = [
//     City(name: 'الرياض', latLng: LatLng(24.7136, 46.6753)),
//     City(name: 'جدة', latLng: LatLng(21.4858, 39.1925)),
//     City(name: 'مكة', latLng: LatLng(21.3891, 39.8579)),
//     City(name: 'الدمام', latLng: LatLng(26.4207, 50.0888)),
//     // أضف مدن أخرى
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return FlutterMap(
//
//         options: MapOptions(
//           center: LatLng(23.8859, 45.0792), // مركز السعودية
//           zoom: 5.5,
//           minZoom: 5.5,
//           maxZoom: 8.0, // ممكن تكبير خفيف فقط
//           interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag, // فقط سحب وتكبير
//           maxBounds: LatLngBounds(
//             LatLng(16.0, 34.0), // جنوب وشمال السعودية
//             LatLng(32.0, 56.0), // شمال وشرق السعودية
//           ),
//         ),
//         children: [
//           TileLayer(
//             urlTemplate: 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
//             subdomains: ['a', 'b', 'c'],
//           ),
//           MarkerLayer(
//             markers:
//             context.read<HomeProvider>().showAllMap?
//             context.read<GeneralProvider>().mapCountry.cities.map((city) => Marker(
//               width: 80.0,
//               height: 80.0,
//               point: LatLng(city.latitude,city.longitude),
//               builder: (ctx) => TextBoxWidget( text: city.name,),
//             )).toList()
//                   :
//             cities.map((city) => Marker(
//               width: 80.0,
//               height: 80.0,
//               point: city.latLng,
//               builder: (ctx) => Column(
//                 children: [
//                   Icon(Icons.location_on, color: Colors.red, size: 30),
//                   Text(
//                     city.name,
//                     style: TextStyle(fontSize: 12, color: Colors.black),
//                   ),
//                 ],
//               ),
//             )).toList(),
//           ),
//         ],
//       );
//   }
// }
//
// class City {
//   final String name;
//   final LatLng latLng;
//   City({required this.name, required this.latLng});
// }
