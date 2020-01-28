import 'package:flutter/material.dart';
import 'package:ifnews/var_globais.dart';

class PostCard extends StatefulWidget {
  String title;
  String date;
  String description;
  String img;
  bool dateNull;
  bool imgNull;

  PostCard(String title, String date, String description, String img,
      bool dateNull, bool imgNull) {
    this.title = title;
    this.date = date;
    this.description = description;
    this.img = img;
    this.dateNull = dateNull;
    this.imgNull = imgNull;
  }

  @override
  _PostCardState createState() =>
      _PostCardState(title, date, description, img, dateNull, imgNull);
}

class _PostCardState extends State<PostCard> {
  String title;
  String date;
  String description;
  String img;
  bool dateNull;
  bool imgNull;

  _PostCardState(String title, String date, String description, String img,
      bool dateNull, bool imgNull) {
    this.title = title;
    this.date = date;
    this.description = description;
    this.img = img;
    this.dateNull = dateNull;
    this.imgNull = imgNull;
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Row(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: imgNull
              ? FittedBox(
                  child: Icon(
                    Icons.crop_original,
                    size: tamanhoIcon,
                  ),
                )
              : Image.network(img,
                  width: tamanhoIcon, height: tamanhoIcon, fit: BoxFit.cover),
        ),
        Padding(
          padding: EdgeInsets.only(left: 10),
          child: SizedBox(
            width: queryData.size.width - tamanhoIcon - 50,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 1,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: fonteTitulo, fontWeight: FontWeight.bold),
                ),
                Text(description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: numLinhasDescricao,
                    style: TextStyle(fontSize: fonteDescricao)),
                Text(
                  dateNull ? "" : "Publicado em: $date",
                  style: TextStyle(fontSize: fonteData, color: Colors.black54),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
