import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:animator/animator.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:ifnews/dados.dart';
import 'package:ifnews/var_globais.dart';
import 'package:ifnews/config_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('IF News'),
        centerTitle: true,
      ),
      drawer: SizedBox(
        width: queryData.size.width * 0.7,
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 10.0, top: 10.0),
            color: Colors.white,
            child: Column(children: <Widget>[
              RaisedButton.icon(
                icon: Icon(Icons.settings),
                onPressed: () {
                  Navigator.of(context).push(ConfigFontPageRouter());
                },
                label: Text('Configurações'),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

