import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/helpers/mobile_format_helper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart' as xml;

import '../models/bonus_cart.dart';


class BonusCardService {

  static Future <BonusKart> getDetails() async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    var mobile = prefs.getString('user_mobile');

    var cardNo = await getCardNumberByMobile( "0557969888" );

    if( cardNo.length > 12 )
    {
      var cardBalans;
      final response2 = await http
          .get(Uri.parse('http://217.64.22.158:8088/Olimpos/CrmServis/OlymposMobile.asmx/GetPuan?MkrtNo='+cardNo));
      var storeDocument2 = xml.XmlDocument.parse(response2.body.toString());
      cardBalans = jsonDecode(storeDocument2.innerText)[0]['PUAN'].toString();
      cardBalans = double.parse(cardBalans)/10;
      return BonusKart(
        cardNo.toString().substring(4,13),
        cardBalans.toStringAsFixed(2),
        cardNo.toString(),
        "found"
      );
    }
    return BonusKart("0","0","0", "notfound");
  }

  static getCardNumberByMobile( mobile ) async {
    mobile = MobileFormatHelper().olymposFormat(mobile);
    final response = await http
        .get(Uri.parse('http://217.64.22.158:8088/Olimpos/CrmServis/OlymposMobile.asmx/KartNoByCepTel?CepTel='+mobile));

    var storeDocument = xml.XmlDocument.parse(response.body.toString());
    return (jsonDecode(storeDocument.innerText)['BIREYSEL']);
  }

}
