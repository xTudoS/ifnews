import 'package:flutter/material.dart';
import 'package:ifnews/news_detail_header.dart';

void main() => runApp(Home());


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IFNews',
      home: HomePage(),
      
    );
  }
}


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
    return Material(
      child: Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            NewsDetailHeader(),
            _buildListView(_dados['dados']['categorias']['noticias'])
          ],
        ),
      )
    ),
    );
  }
  Widget _buildListView(List dados) {
    return ListView.builder(
            itemCount: dados.length,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Text('aksda')
                ],
              );
            });

}
}