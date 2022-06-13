import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/profile_model.dart';
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileService {


  static Future<ProfileModel> getProfileDetails() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/profile/fetch_profile_details');
    var body = json.encode({
      'user_id' : 3,
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
        ProfileModel newProfileModel = ProfileModel.fromJson( data );

        return newProfileModel;
      }

    }

    return ProfileModel();

  }

  static updateProfile( profileModel ) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var userId = prefs.getString('user_id');
    final uri = Uri.parse(Config().apiBaseUrl + 'account/profile/update_profile');

    var body = jsonEncode({
      "profile_details": profileModel,
      "user_id": 3,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

  }

}