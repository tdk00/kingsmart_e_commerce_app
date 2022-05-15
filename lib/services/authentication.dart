import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Authentication {


  static createOtp ( mobile ) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('user_mobile', mobile ) ;

    final uri = Uri.parse(Config().apiBaseUrl + 'login/Authentication/create_otp');
    var body = json.encode({
          "mobile": mobile,
        });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    if ( statusCode == 200 ) {
        var status = jsonDecode(responseBody)['status'];
        return status;
    }

  }

  static confirmOtp ( otp ) async {
    final prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString('user_mobile') ;

    final uri = Uri.parse(Config().apiBaseUrl + 'login/Authentication/confirm_otp');
    var body = json.encode({
      "mobile": mobile,
      "otp" : otp
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    if ( statusCode == 200 ) {
      var status = jsonDecode(responseBody)['status'];
      if( status == true )
        {
          var userId = jsonDecode(responseBody)['user_id'];
          var userToken = jsonDecode(responseBody)['user_token'];
          prefs.setString('user_id', userId);
          prefs.setString('user_token', userToken);
          return true;
        }

      return false;

    }

  }

}