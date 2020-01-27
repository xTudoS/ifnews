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
  for (var i = 0;i<fixed.length;i++){
    print(fixed[i].children);
    break;
  }

  // document.
  
}