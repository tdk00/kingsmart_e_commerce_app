import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../../models/order_model.dart';
import '../../helpers/config.dart';


class OrderService {

  static Future <OrderModel> getLastOrder() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/fetch_last_order');
    var body = json.encode({ });

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
          OrderModel orderModel = OrderModel.fromJson( jsonDecode(responseBody)['data'] );
          orderModel.items = [];
          return orderModel;
      }

    }
    return OrderModel(id: -1, userId: 0, orderNumber: '', city: '', address: '', postal: '', note: '', payment: '', total: 0, status: '', items: [], createdAt: '');

  }

  static Future <OrderModel> getOrderById( orderId ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/fetch_order_by_id');
    var body = json.encode({
      "order_id" : orderId
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
        OrderModel orderModel = OrderModel.fromJson( jsonDecode(responseBody)['order_details'] );
        orderModel.items = [];
        for( var orderItemData in jsonDecode(responseBody)['items'] ){
          OrderItemModel orderItemModel = OrderItemModel.fromJson( orderItemData );
          orderModel.items.add(orderItemModel);
        }
        return orderModel;
      }

    }
    return OrderModel(id: -1, userId: 0, orderNumber: '', city: '', address: '', postal: '', note: '', payment: '', total: 0, status: '', items: [], createdAt: '');

  }

  static Future <List<OrderModel>> getOrdersByDateRange( String dateFrom, String dateTo ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/fetch_orders_by_date_range');
    var body = json.encode({
      "date_from" : dateFrom,
      "date_to" : dateTo
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
    List<OrderModel> ordersList = [];
    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];
        for( var order in data ) {
          OrderModel orderModel = OrderModel.fromJson( order );
          ordersList.add(orderModel);
        }
        return ordersList;
      }

    }
    return [];

  }


  static addOrder() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'checkout/order/add_order');

    var body = jsonEncode({ });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };


    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;
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
