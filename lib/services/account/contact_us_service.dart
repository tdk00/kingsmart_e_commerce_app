import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/contact_us_model.dart';
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/profile_model.dart';
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ContactUsService {

  static Future<ContactUsModel> getDetails() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/contact_us/fetch_details');
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
        ContactUsModel contactUsModel = ContactUsModel.fromJson( data );

        return contactUsModel;
      }

    }

    return ContactUsModel( whatsapp: '', phone: '', email: '' );

  }

}