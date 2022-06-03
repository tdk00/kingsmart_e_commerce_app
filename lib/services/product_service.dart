import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/services/config.dart';

class ProductService {

  static Future addNote( productId, note ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'product/product/edit_note');
    var body = json.encode({
      'user_id' : 3,
      'product_id' : productId,
      'note' : note
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    var resultNote = "";
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];

        resultNote = data['note'];
        return note;
      }
      else
        {
          return "";
        }

    }

    return resultNote;

  }

  static Future<ProductModel> getProductById( ProductModel productModel ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'product/product/fetch_product_by_id');
    var body = json.encode({
      'user_id' : 3,
      "product_id" : productModel.id
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
        ProductModel newProductModel = ProductModel.fromJson( data['product'] );

        return newProductModel;
      }

    }

    return productModel;

  }

  static Future<List<ProductModel>> getRelatedProductsById( ProductModel productModel ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'product/product/fetch_related_products');
    var body = json.encode({
      'user_id' : 3,
      "product_id" : productModel.id
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