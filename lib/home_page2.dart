import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animator/animator.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  Map<String, dynamic> _dados = {
    'dados': {
      'categorias': {
        'noticias': [
          {
            'categoria': 'noticia',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'Alunos e Professores publicam trabalho no exterior',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'descricao':
                'Trabalho é resultado de projeto de extensão do curso de Engenharia Civil do Campus Cajazeiras',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
          {
            'categoria': 'noticia',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'Alunos e Professores publicam trabalho no exterior',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'descricao':
                'Trabalho é resultado de projeto de extensão do curso de Engenharia Civil do Campus Cajazeiras',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
        ],
        'comunicados': [
          {
            'categoria': 'comunicado',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'Comunicado',
            'descricao': 'Comunicamos',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
          {
            'categoria': 'comunicado',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'Comunicado',
            'descricao': 'Comunicamos',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
        ],
        'editais': [
          {
            'categoria': 'edital',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'edital',
            'descricao': 'Descrição',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
          {
            'categoria': 'edital',
            'data_publicacao': '11:11hrs 26/06/2019',
            'titulo': 'edital',
            'descricao': 'Descrição',
            'url':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior',
            'image':
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/06/alunos-e-professores-publicam-trabalho-no-exterior/img_20190415_164306.jpg'
          },
        ],
      }
    }
  };

  double _sizedUpdate = 1;

  double _sizedFontDescription = 25;
  double _sizedFontTitle = 35;
  double _sizedFontTitleListTile = 20;
  double _sizedFontDescriptionListTile = 15;

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("IF News"),
          centerTitle: true,
        ),
        body: _buildListView(
            _dados['dados']['categorias']['noticias'], queryData.size),
        drawer: SizedBox(
          width: queryData.size.width * 0.8,
          child: Container(
            padding: EdgeInsets.only(top: 15.0),
            color: Colors.white,
            child: SafeArea(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Center(
                        child: Text(
                          'Ajustar tamanho da fonte',
                          style: TextStyle(
                            fontSize: _sizedFontTitleListTile,
                          ),
                        ),
                      ),
                      Slider(
                        activeColor: Colors.black,
                        value: _sizedUpdate,
                        min: 0.5,
                        max: 1.5,
                        onChanged: (newRating) {
                          setState(() {
                            _sizedUpdate = newRating;
                            _sizedFontDescriptionListTile = 10 * _sizedUpdate;
                            _sizedFontDescription = 20 * _sizedUpdate;
                            _sizedFontTitle = 30 * _sizedUpdate;
                            _sizedFontTitleListTile = 15 * _sizedUpdate;
                          });
                        },
                      ),
                    ],
                  ),
                  Positioned(
                    width: queryData.size.width * 0.8,
                    bottom: 20.0,
                    child: Center(
                      child: Text('IF News - Agregador de notícias do IFPB'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _fixedWidget(Map<String, dynamic> data, var size) {
    return Stack(
      children: <Widget>[
        Image.network(
          data['image'],
          fit: BoxFit.cover,
          height: size.height - 30,
        ),
        Positioned(
          bottom: 130,
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              SizedBox(
                width: size.width,
                child: Text(
                  data['descricao'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _sizedFontDescription,
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 3
                      ..color = Colors.black,
                  ),
                ),
              ),

              // Solid text as fill.
              SizedBox(
                width: size.width,
                child: Text(
                  data['descricao'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: _sizedFontDescription,
                    color: Colors.grey[300],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 230,
            // heightFactor: 12,
            child: Stack(
              children: <Widget>[
                // Stroked text as border.
                SizedBox(
                  width: size.width,
                  child: Text(
                    data['titulo'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _sizedFontTitle,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.black,
                    ),
                  ),
                ),

                // Solid text as fill.
                SizedBox(
                  width: size.width,
                  child: Text(
                    data['titulo'],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: _sizedFontTitle,
                      color: Colors.grey[300],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget getFixedWidget(Map<String, dynamic> data, var size) {
    return CarouselSlider(
      height: size.height - 30,
      viewportFraction: 1.0,
      items: <Widget>[
        Stack(
          children: <Widget>[
            _fixedWidget(data, size),
            Animator(
              tween: Tween<double>(begin: 70, end: 90),
              cycles: 0,
              duration: Duration(milliseconds: 200),
              builder: (anim) => Positioned(
                bottom: anim.value,
                width: size.width,
                child: Icon(
                  Icons.arrow_drop_up,
                  size: 60.0,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _newsWidget(Map<String, dynamic> data, int index) {
    if (index == 0) {
      return ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        child: RaisedButton(
          onPressed: () async {
            if (await canLaunch(data['url'])) {
              await launch(data['url']);
            } else {
              throw "Não foi possível abrir o link ${data['url']}";
            }
          },
          onLongPress: () {
            Share.share("${data['titulo']} - ${data['url']} - IF News",
                subject: data['titulo']);
          },
          color: Colors.white,
          child: ListTile(
            leading: Image.network(data['image']),
            title: Text(
              data['titulo'],
              style: TextStyle(fontSize: _sizedFontTitleListTile),
            ),
            subtitle: Text(
              data['data_publicacao'],
              style: TextStyle(fontSize: _sizedFontDescriptionListTile),
            ),
            dense: true,
            trailing: Icon(Icons.arrow_right),
          ),
        ),
      );
    } else {
      return RaisedButton(
        onPressed: () async {
          if (await canLaunch(data['url'])) {
            await launch(data['url']);
          } else {
            throw "Não foi possível abrir o link ${data['url']}";
          }
        },
        onLongPress: () {
          Share.share("${data['titulo']} - ${data['url']} - IF News",
              subject: data['titulo']);
        },
        color: Colors.white,
        child: ListTile(
          leading: Image.network(data['image']),
          title: Text(
            data['titulo'],
            style: TextStyle(fontSize: _sizedFontTitleListTile),
          ),
          subtitle: Text(
            data['data_publicacao'],
            style: TextStyle(fontSize: _sizedFontDescriptionListTile),
          ),
          dense: true,
          trailing: Icon(Icons.arrow_right),
        ),
      );
    }
  }

  Widget _buildListView(List dados, var size) {
    return Stack(
      children: <Widget>[
        getFixedWidget(dados[1], size),
        DraggableScrollableSheet(
          initialChildSize: 0.1,
          minChildSize: 0.1,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return ListView.builder(
              padding: EdgeInsets.only(top: 10.0),
              controller: scrollController,
              itemCount: 30,
              itemBuilder: (context, index) {
                return _newsWidget(dados[1], index);
              },
            );
          },
        ),
      ],
    );
  }
}
