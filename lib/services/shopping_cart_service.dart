import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/bonus_cart.dart';
import 'config.dart';


class ShoppingCartService {

  static Future <ShoppingCartModel> getShoppingCart() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'main/ShoppingCart/get_cart');
    var body = json.encode({
      "user_id": 3,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    var a = ShoppingCartModel();
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];
        // print(data);
        for( var item in data['items'] ) {
          print( item['details']['isFavorite'].toString() + "buuu");
          a.increaseProduct(
              ProductModel(
                  item['details']['id'].toString(),
                  item['details']['title'].toString(),
                  item['details']['summary'].toString(),
                  item['details']['image'].toString(),
                  double.parse(item['details']['price'].toString()),
                  double.parse(item['details']['discount'].toString()),
                  int.parse(item['details']['isFavorite'].toString()) > 0 )
          );

        }
      }

    }
      return a;

  }

  static updateShoppingCart( shoppingCart ) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'main/ShoppingCart/update_cart');
    Map<String, int> shoppingCartProducts = {};
    shoppingCart.shoppingCartItems.forEach((k,v) => shoppingCartProducts[k.id.toString()] = v );

    var body = jsonEncode({
      "items": (shoppingCartProducts),
      "user_id": 3,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    // int statusCode = response.statusCode;
    String responseBody = response.body;

    print(responseBody);
    // if ( statusCode == 200 ) {
    //   print( jsonDecode(responseBody) ) ;
    // }
    return ShoppingCartModel();

  }

}
