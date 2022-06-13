import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/order_model.dart';
import '../models/news_model.dart';
import 'config.dart';


class NewsService {

  static Future <NewsModel> getNewsById( newsId ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'main/news/fetch_news_by_id');
    var body = json.encode({
      "user_id": 3,
      "news_id" : newsId
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
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
