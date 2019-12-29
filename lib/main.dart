import 'package:flutter/material.dart';
// import 'package:ifnews/news_detail_header.dart';
import 'package:ifnews/home_page.dart';

void main() => runApp(Home());

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFNews',
      home: HomePage(),
      // theme: ThemeData(
        
      // ),
    );
  }
}

