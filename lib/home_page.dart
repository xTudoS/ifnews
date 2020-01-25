import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:animator/animator.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // AnimationController _animationController;

  // @override
  // void initState(){
  //   super.initState();
  //   _animationController = AnimationController(
  //     duration: const Duration(seconds: 1),
  //     vsync: this,
  //   )..repeat();
  // }

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

  // @override
  // void initState(){
  //   super.initState();
  //   _periodicHeight();
  // }

  // var _bottom = true;

  // _periodicHeight(){
  //   const duration = Duration(milliseconds: 500);
  //   Timer.periodic(duration, (Timer t) => _changeHeight());
  // }

  // _changeHeight(){
  //   _bottom = !_bottom;
  //   return _bottom;
  // }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return Material(
        // color: Colors.white,
        child: _buildListView(
            _dados['dados']['categorias']['noticias'], queryData.size));
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
          bottom: 70,
          child: Stack(
            children: <Widget>[
              // Stroked text as border.
              SizedBox(
                width: size.width,
                child: Text(
                  data['descricao'],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25,
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
                    fontSize: 25,
                    color: Colors.grey[300],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
            bottom: 150,
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
                      fontSize: 35,
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
                      fontSize: 35,
                      color: Colors.grey[300],
                    ),
                  ),
                )
              ],
            )),
      ],
    );
  }

  Widget get_fixedWidget(Map<String, dynamic> data, var size) {
    return CarouselSlider(
      height: size.height - 30,
      viewportFraction: 1.0,
      items: <Widget>[
        Stack(
          children: <Widget>[
            _fixedWidget(data, size),
            Animator(
              tween: Tween<double>(begin: 10, end: 20),
              cycles: 0,
              duration: Duration(milliseconds: 300),
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
        child: Container(
          padding: EdgeInsets.all(0),
          color: Colors.white,
          child: ListTile(
            leading: Image.network(data['image']),
            title: Text(
              data['titulo'],
              style: TextStyle(fontSize: 20.0),
            ),
            subtitle: Text(
              data['data_publicacao'],
              style: TextStyle(fontSize: 15.0),
            ),
            dense: true,
            trailing: Icon(Icons.arrow_right),
            onTap: () {},
          ),
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(0),
        color: Colors.white,
        child: ListTile(
          leading: Image.network(data['image']),
          title: Text(
            data['titulo'],
            style: TextStyle(fontSize: 20.0),
          ),
          subtitle: Text(
            data['data_publicacao'],
            style: TextStyle(fontSize: 15.0),
          ),
          dense: true,
          trailing: Icon(Icons.arrow_right),
          onTap: () {},
        ),
      );
    }
  }

  Widget _buildListView(List dados, var size) {

    return Stack(
      children: <Widget>[
        get_fixedWidget(dados[1], size),
        DraggableScrollableSheet(
          initialChildSize: 0.13,
          minChildSize: 0.13,
          maxChildSize: 1.0,
          builder: (context, scrollController) {
            return ListView.builder(
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
