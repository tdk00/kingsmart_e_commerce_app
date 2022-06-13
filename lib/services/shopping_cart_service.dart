import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
        a.clearShoppingCart();
        var cart = jsonDecode(responseBody)['data'];
        for( var item in cart['items'] )
        {
          var quantity = item['quantity'] ?? "0";
          a.addToCartWithQuantity( ProductModel.fromJson( item['details'] ), int.parse( quantity ) );
        }
      }

    }
      return a;

  }

  static updateShoppingCart( shoppingCart, { forceUpdate = false } ) async {
    if( shoppingCart.isModified == false && forceUpdate == false ) return;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'main/ShoppingCart/update_cart');
    Map<String, int> shoppingCartProducts = {};
    shoppingCart.shoppingCartItems.forEach((productModel,productCount) => shoppingCartProducts[ productModel.id.toString()] = productCount );

    shoppingCart.isModified = false;
    var body = jsonEncode({
      "items": shoppingCartProducts,
      "user_id": 3,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    await http.post(uri, body: body, headers: headers);

  }

}
