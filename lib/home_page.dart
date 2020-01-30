import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:animator/animator.dart';
// import 'package:share/share.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:http/http.dart' as http;

// import 'package:ifnews/dados.dart';
import 'package:ifnews/var_globais.dart';
import 'package:ifnews/config_page.dart';
import 'package:ifnews/scraping/instagram.dart';
import 'package:ifnews/scraping/ifpb_cajazeiras.dart';
import 'package:ifnews/carousel_slider/carousel_slider_posts.dart';
// import 'package:ifnews/post_card.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<String> getDados() async {
    postsInsta = [];
    postsPortalIFPB = [];

    await intagramScrap();
    await portalIFPBScrap();

    return 'Ok';
  }
  

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('IF News'),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: getDados(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Container(
                child: Text('Error'),
              );
            } else {
              return CarouselSliderPosts();
            }
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
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
