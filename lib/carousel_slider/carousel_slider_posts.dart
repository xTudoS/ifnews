import 'package:flutter/material.dart';
import 'package:ifnews/var_globais.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:ifnews/post_card.dart';

class CarouselSliderPosts extends StatefulWidget {
  @override
  _CarouselSliderPostsState createState() => _CarouselSliderPostsState();
}

class _CarouselSliderPostsState extends State<CarouselSliderPosts> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return CarouselSlider(
      height: queryData.size.height,
      viewportFraction: 1.0,
      items: <Widget>[
        buildListView(postsInsta),
        buildListView(postsPortalIFPB),
      ],
    );
  }

  Widget buildListView(var dados) {
    return DraggableScrollableSheet(
      initialChildSize: 0.1,
      minChildSize: 0.1,
      maxChildSize: 1.0,
      builder: (context, scrollController) {
        return ListView.builder(
          controller: scrollController,
          itemCount: dados.length,
          itemBuilder: (context, index) {
            return Container(
              color: Colors.white,
              child: Card(
                  elevation: 10,
                  child: RaisedButton(
                    color: Colors.white,
                    onPressed: () async {
                      if (await canLaunch(dados[index]['url'])) {
                        await launch(dados[index]['url']);
                      } else {
                        throw "Não foi possível abrir o link ${dados[index]['url']}";
                      }
                    },
                    onLongPress: () {
                      Share.share(
                          "${dados[index]['description']} - ${dados[index]['url']} - IF News",
                          subject: dados[index]['title']);
                    },
                    child: PostCard(
                      dados[index]['title'],
                      dados[index]['date_publish'],
                      dados[index]['description'],
                      dados[index]['img'],
                      dados[index]['date_publish'] == null,
                      dados[index]['img'] == null,
                    ),
                  )),
            );
          },
        );
      },
    );
  }
}
