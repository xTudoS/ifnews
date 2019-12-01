import 'package:flutter/material.dart';
import 'package:ifnews/news_detail_header.dart';

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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        // color: Colors.white54,
          child: Container(
              child:
                  NewsDetailHeader(),
    )));
  }

  
}
