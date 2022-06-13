import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/services/config.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/reference_slider_model.dart';

class ReferenceSliderService {

  static Future <List<ReferenceSliderModel>> getDetails() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'main/MainScreen/fetch_sliders');
    var body = json.encode({});

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
          List<ReferenceSliderModel> slidersList = [];
          for( var item in data ) {
              ReferenceSliderModel slider = ReferenceSliderModel(
                  item['id'],
                  item['title'],
                  item['summary'],
                  int.tryParse(item['newsId']) ?? 0,
                  item['icon'],
                  item['hasLink'] == '1' ? true : false
              );

              slidersList.add(slider);
          }
          return slidersList;
        }

    }

    return [];

  }

}