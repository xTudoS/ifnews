// import 'package:flutter/material.dart';
// import 'package:ifnews/var_globais.dart';
// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';

// class CarouselSliderDestaque extends StatefulWidget {
//   @override
//   _CarouselSliderDestaqueState createState() => _CarouselSliderDestaqueState();
// }

// class _CarouselSliderDestaqueState extends State<CarouselSliderDestaque> {
//   @override
//   Widget build(BuildContext context) {
//     MediaQueryData queryData = MediaQuery.of(context);

//     return Image.network(
//       postsPortalIFPB[0]['img'],
//       fit: BoxFit.cover,
//       height: queryData.size.height,
//     );
//   }

//   // List<Widget> buildWidgetDestaque(var size) {
//   //   List<Widget> widgets = [];

//   //   for (var post in postsPortalIFPB) {
//   //     var w = Stack(children: <Widget>[
//   //       Image.network(
//   //         post['img'],
//   //         fit: BoxFit.cover,
//   //         height: size.height - 30,
//   //       ),
//   //       Positioned(
//   //           bottom: 130,
//   //           child: Stack(children: <Widget>[
//   //             // Stroked text as border.
//   //             SizedBox(
//   //               width: size.width,
//   //               child: Text(
//   //                 post['description'],
//   //                 textAlign: TextAlign.center,
//   //                 style: TextStyle(
//   //                   fontSize: fonteDescricao,
//   //                   foreground: Paint()
//   //                     ..style = PaintingStyle.stroke
//   //                     ..strokeWidth = 3
//   //                     ..color = Colors.black,
//   //                 ),
//   //               ),
//   //             ),

//   //             // Solid text as fill.
//   //             SizedBox(
//   //               width: size.width,
//   //               child: Text(
//   //                 post['description'],
//   //                 textAlign: TextAlign.center,
//   //                 style: TextStyle(
//   //                   fontSize: fonteDescricao,
//   //                   color: Colors.grey[300],
//   //                 ),
//   //               ),
//   //             )
//   //           ]))
//   //     ]);

//   //     widgets.add(w);
//   //     break;
//   //   }

//   //   return widgets;
//   // }
// }
