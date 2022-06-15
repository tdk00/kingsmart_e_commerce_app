import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import '../models/news_model.dart';
import '../helpers/config.dart';


class NewsService {

  static Future <NewsModel> getNewsById( newsId ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'main/news/fetch_news_by_id');
    var body = json.encode({
      "news_id" : newsId
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        NewsModel newsModel = NewsModel.fromJson( jsonDecode(responseBody)['data'] );
        return newsModel;
      }

    }
    return NewsModel(id: -1, title: '', image: '', content: '', createdAt: '');

  }


}
