import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/promo_products_model.dart';
import 'package:kingsmart_online_app/helpers/config.dart';

class PromosService {

  static Future <PromoProductsModel> getPromoProducts( int limit ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'promo/promo/fetch_promo_products');
    var body = json.encode({
      'limit' : limit
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    PromoProductsModel favoriteProducts = PromoProductsModel();
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

}