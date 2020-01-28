var now = DateTime.now();
var dia = int2str(now.day);
var mes = int2str(now.month);
var ano = now.year;

String int2str(int num){
  String numStr = num.toString();
  if (numStr.length >= 2){
    return numStr;
  } else {
    return "0$numStr";
  }
}

List postsInsta = [];

String date = "$dia/$mes/$ano";

double rating = 12;
double fonteTitulo = 27;
double fonteDescricao = 22;
double fonteData = 12;
double tamanhoIcon = 102;

int numLinhasDescricao = 2;
int numPosts = 10;

String textoDescricaoLoremIpisum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac augue vel justo consequat accumsan et ut mauris. Donec a bibendum diam, non finibus est.';