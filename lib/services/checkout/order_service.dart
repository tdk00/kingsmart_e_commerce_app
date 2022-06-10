import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/order_model.dart';
import '../config.dart';


class OrderService {

  static Future <OrderModel> getLastOrder() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/fetch_last_order');
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
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {

          OrderModel orderModel = OrderModel.fromJson( jsonDecode(responseBody)['data'] );
          orderModel.items = [];
          return orderModel;
      }

    }
    return OrderModel(id: -1, userId: 0, orderNumber: '', city: '', address: '', postal: '', note: '', payment: '', total: 0, items: [], createdAt: '');

  }


  static addOrder() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/add_order');

    var body = jsonEncode({
      "user_id": 3,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };


    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    print(responseBody);
    if( statusCode == 200 )
      {

        if( jsonDecode(responseBody)['status'] == true )
          {
            return {'status': true, 'error_message' : "" };
          }
        else
          {
            return {'status': false, 'error_message' : jsonDecode(responseBody)['error_message'] };
          }
      }
    return {'status': false, 'error_message' : "Səhv yaarandı" };

  }



}
