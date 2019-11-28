import 'package:flutter/material.dart';
import 'package:ifnews/arc_banner_image.dart';

class NewsDetailHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.all(0),
      onPressed: () {},
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: ArcBannerImage(
                'http://www.ifpb.edu.br/cajazeiras/noticias/2019/11/dia-da-consciencia-negra-sera-comemorado-com-ciclo-de-palestras/movimento-negro.jpg/@@images/d780a033-2c2e-4e72-b6d7-9ef10166242e.jpeg'),
          ),
          Text(
              'Dia da Consciência Negra será comemorado com ciclo de palestras',
              style: TextStyle(fontSize: 30.0, color: Colors.black)),
          Text(
              'Evento promovido pelo LABUM acontecerá na quarta, dia 20 de novembro. Ler mais...',
              style: TextStyle(fontSize: 20.0, color: Colors.black)),
        ],
      ),
    );
  }
}
