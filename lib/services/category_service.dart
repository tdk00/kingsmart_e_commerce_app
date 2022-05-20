import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/category_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {

  static Future <List<CategoryModel>> getTrendCategories() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'category/category/fetch_trend_categories');
    var body = json.encode({
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
        var data = jsonDecode(responseBody)['data'];
        List<CategoryModel> categoryList = [];
        for( var category in data ) {
          CategoryModel categoryModel = CategoryModel.fromJson( category );

          categoryList.add(categoryModel);
        }
        return categoryList;
      }

    }

    return [];

  }

}