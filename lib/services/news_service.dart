import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../helpers/config.dart';


class NewsService {

  static Future <List<NewsModel>> getAllNews() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'main/news/fetch_all_news');
    var body = json.encode({
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    if( jsonDecode(responseBody)['status'] == true )
    {

      var data = jsonDecode(responseBody)['data'];
      List<NewsModel> newsList = [];
      for( var news in data ) {

        NewsModel productModel = NewsModel.fromJson( news );

        newsList.add(productModel);
      }
      return newsList;
    }
    return [];

  }


}
