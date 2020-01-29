import 'package:http/http.dart' as http;
import 'package:html/parser.dart' show parse;
import 'package:html/dom.dart';

main() async {
  var url = 'http://www.ifpb.edu.br/cajazeiras';
  var response = await http.get(url);
  print('Hello World');
  print("Response status: ${response.statusCode}");
  // print('Response body: ${response.body}');
  var document = parse(response.body);
  var fixed = document.getElementsByClassName('collection-item');
  for (var link in fixed){
    var doc = link.children;
    var head = parse(doc[0].outerHtml);
    var img = parse(doc[2].outerHtml);
    
    var title = head.children[0].querySelector('a');
    var urlImg = img.children[0].querySelector('img');
    var d = title.attributes;
    d['img'] = (urlImg.attributes['src']);

    // print(doc.attributes);
    // var doc2 = parse(doc.children[0].outerHtml);
    // print(doc2.attributes.values);
    print(d);
    break;
  }
  
}