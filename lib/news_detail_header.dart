import 'package:flutter/material.dart';
import 'package:ifnews/arc_banner_image.dart';

class NewsDetailHeader extends StatelessWidget {
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

  Widget _fixedWidget(Map<String, dynamic> data) {
    
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 10.0),
          child: ArcBannerImage(
              data['image']),
        ),
        Text(data['titulo'],
            textAlign: TextAlign.justify,
            style: TextStyle(fontSize: 20.0, color: Colors.black)),
        // Text(
        //     data['descricao'],
        //     style: TextStyle(fontSize: 20.0, color: Colors.black)),
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
      onTap: (){},
    );
  }

  Widget _buildListView(List dados) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          if (index == 0) {
            return _fixedWidget(dados[index]);
          } else {
            return _newsWidget(dados[1]);
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    return _buildListView(_dados['dados']['categorias']['noticias']);
  }
}
