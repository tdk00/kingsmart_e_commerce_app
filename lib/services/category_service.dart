import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/category_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoryService {

  static Future <List<CategoryModel>> getMainCategories() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'category/category/fetch_main_categories');
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

  static Future <List<ProductModel>> fetchProductsByCategoryId( int categoryId, String sortBy ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'category/category/fetch_products_by_category_id');
    var body = json.encode({
      'user_id' : 3,
      "category_id" : categoryId,
      "sort_by" : sortBy
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    print(responseBody);
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];
        List<ProductModel> productList = [];
        for( var product in data ) {
          ProductModel productModel = ProductModel.fromJson( product );

          productList.add(productModel);
        }
        return productList;
      }

    }

    return [];

  }

  static Future <List<ProductModel>> fetchProductsBySearch( String? searchKeyWord, String sortBy ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'category/category/fetch_products_by_search');
    print(searchKeyWord.toString() + "lllllllllllllll");
    var body = json.encode({
      'user_id' : 3,
      "search_keyword" : searchKeyWord,
      "sort_by" : sortBy
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
        List<ProductModel> productList = [];
        for( var product in data ) {
          ProductModel productModel = ProductModel.fromJson( product );

          productList.add(productModel);
        }
        return productList;
      }

    }

    return [];

  }

}