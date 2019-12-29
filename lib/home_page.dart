import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';


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

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);
    return SafeArea(
        child: Material(
            // color: Colors.white,
            child: _buildListView(
                _dados['dados']['categorias']['noticias'], queryData.size)));
  }

  Widget _fixedWidget(Map<String, dynamic> data, var size) {
    return ClipPath(
        clipper: ArcClipper(),
        child: Stack(
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
                          fontSize: 20,
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
                          fontSize: 20,
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
                          fontSize: 30,
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
                          fontSize: 30,
                          color: Colors.grey[300],
                        ),
                      ),
                    )
                  ],
                )),

          ],
        ));
  }

  Widget get_fixedWidget(Map<String, dynamic> data, var size){
    return CarouselSlider(
      height: size.height - 30,
      viewportFraction: 1.0,
      items: <Widget>[
        _fixedWidget(data, size),
      ],
    );
  }

  Widget _newsWidget(Map<String, dynamic> data) {
    return ListTile(
      leading: Image.network(data['image']),
      title: Text(data['titulo']),
      subtitle: Text(data['data_publicacao']),
      dense: true,
      trailing: Icon(Icons.arrow_right),
      onTap: () {},
    );
  }

  Widget _buildListView(List dados, var size) {
    return ListView.builder(
        itemCount: 30,
        itemBuilder: (context, index) {
          if (index == 0) {
            return get_fixedWidget(dados[1], size);
          } else {
            return _newsWidget(dados[1]);
          }
        });
  }
}

class ArcClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
