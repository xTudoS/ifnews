import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ifnews/var_globais.dart';


class ConfigFontPageRouter extends CupertinoPageRoute {
  ConfigFontPageRouter()
      : super(builder: (BuildContext context) => ConfigFontPage());

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    // TODO: implement buildPage
    return FadeTransition(
      opacity: animation,
      child: ConfigFontPage(),
    );
  }
}

class ConfigFontPage extends StatefulWidget {
  @override
  _ConfigFontPageState createState() => _ConfigFontPageState();
}

class _ConfigFontPageState extends State<ConfigFontPage> {
  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Configurações de Fonte'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: Column(
            children: <Widget>[
              Text(
                'Tamanho do texto das notícias',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: queryData.size.width - 100,
                    child: Slider(
                      activeColor: Colors.black,
                      value: rating,
                      min: 12,
                      max: 30,
                      onChanged: (newRating) {
                        setState(() {
                          rating = newRating;
                        });
                      },
                    ),
                  ),
                  Text(
                    rating.toInt().toString(),
                    style: TextStyle(fontSize: 20.0),
                  )
                ],
              ),
            ],
          ),
        ));
  }
}

