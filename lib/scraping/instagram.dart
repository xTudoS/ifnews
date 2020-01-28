import 'package:http/http.dart' as http;
import 'package:ifnews/var_globais.dart';
import 'dart:convert';
import 'dart:io';


Future<http.Response> intagramScrap() async {
  var url = 'https://www.instagram.com/ifpb.oficial/?__a=1';
  var response = await http.get(url);
  Map<String, dynamic> insta = json.decode(response.body);
  
  var postsInstaAPI = insta['graphql']['user']['edge_owner_to_timeline_media']['edges'];
  for (int i = 0; i < numPosts; i++){
    var urlPost = 'https://www.instagram.com/p/${postsInstaAPI[i]["node"]["shortcode"]}?__a=1';
    var response = await http.get(urlPost);
    Map<String, dynamic> instaPost = json.decode(response.body);

    var instaPostsAPI = instaPost['graphql']['shortcode_media'];

    Map<String, dynamic> d = {
      'url': urlPost,
      'img': postsInstaAPI[i]["node"]["display_url"],
      'description': instaPostsAPI['edge_media_to_caption']['edges'][0]['node']['text'],
      'title': "${instaPostsAPI['owner']['full_name']}",
      'date_publish': null,
    };
    postsInsta.add(d);
  }
  
  return response;

}