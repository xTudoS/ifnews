import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

import 'package:ifnews/var_globais.dart';

Future<http.Response> portalIFPBScrap() async {
  var url = 'http://www.ifpb.edu.br/cajazeiras';
  var response = await http.get(url);
  print('Hello World');
  print("Response status: ${response.statusCode}");
  // print('Response body: ${response.body}');
  var document = parse(response.body);
  var fixed = document.getElementsByClassName('collection-item');

  for (var i = 0; i < numPostsPortalIFPB; i++){
    var doc = fixed[i].children;
    var head = parse(doc[0].outerHtml);
    var img = parse(doc[2].outerHtml);
    
    var title = head.children[0].querySelector('a');
    var urlImg = img.children[0].querySelector('img');
    // var d = title.attributes;

    Map<String, dynamic> d = {};


    d['url'] = title.attributes['href'];
    d['description'] = title.attributes['title'];
    d['date_publish'] = null;
    d['title'] = 'Portal IFPB Cajazeiras';
    d['img'] = (urlImg.attributes['src']);

    
    postsPortalIFPB.add(d);

  }

  return response;
  
}

main(){
  portalIFPBScrap();
}