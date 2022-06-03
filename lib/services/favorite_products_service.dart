import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/services/config.dart';

class FavoriteProductsService {

  static Future <FavoriteProductsModel> getFavoriteProducts( int limit ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'product/product/fetch_favorite_products');
    var body = json.encode({
      'user_id' : 3,
      'limit' : limit
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    FavoriteProductsModel favoriteProducts = FavoriteProductsModel();
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];
        for( var product in data ) {
          ProductModel productModel = ProductModel.fromJson( product );
          favoriteProducts.add(productModel);
        }
        return favoriteProducts;
      }

    }

    return favoriteProducts;

  }

  static Future <bool> toggleFavoriteStatus( productId, isFavorite ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'product/product/toggle_is_favorite');
    var body = json.encode({
      'user_id' : 3,
      'product_id' : productId,
      'is_favorite' : isFavorite
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    bool isFavoriteNewStatus = isFavorite;
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];

        isFavoriteNewStatus = data['isFavorite'];
        return isFavoriteNewStatus;
      }

    }

    return isFavoriteNewStatus;

  }

}