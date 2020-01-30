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
List postsPortalIFPB = [];

List carouselSliderPostsDestaque = [];

String date = "$dia/$mes/$ano";

double rating = 10;
double fonteTitulo = 25;
double fonteDescricao = 20;
double fonteData = 10;
double tamanhoIcon = 100;

int numLinhasDescricao = 2;
int numPostsInsta = 10;
int numPostsPortalIFPB = 1;

String textoDescricaoLoremIpisum = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque ac augue vel justo consequat accumsan et ut mauris. Donec a bibendum diam, non finibus est.';