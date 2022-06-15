import 'package:shared_preferences/shared_preferences.dart';

class Config{
  String apiBaseUrl = "https://1001x.az/dxdxdx1/kingsmart_ecommerce/";

  static getToken() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userToken = prefs.getString('user_token') ?? "";
    return userToken;
  }

  static isLoggedIn() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int userId = prefs.getInt('user_id') ?? 0;
    String userToken = prefs.getString('user_token') ?? "";
    if( userId > 0 && userToken.length >  10 ){
      return true;
    }
    else{
      return false;
    }
  }
}