import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:kingsmart_online_app/models/address_model.dart';
import 'package:kingsmart_online_app/helpers/config.dart';

class AddressService {


  static Future<List<AddressModel>> getAddresses() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/fetch_addresses');
    var body = json.encode({});

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

    List<AddressModel> addressList = [];

    if ( statusCode == 200 ) {
      if( jsonDecode(responseBody)['status'] == true )
      {
        var data = jsonDecode(responseBody)['data'];
        for( var address in data ) {
          AddressModel addressModel = AddressModel.fromJson( address );
          addressList.add(addressModel);
        }
        return addressList;
      }

    }

    return [];

  }

  static Future<AddressModel> getSelectedAddress() async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/fetch_selected_address');
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
        var data = jsonDecode(responseBody)['data'];
        AddressModel addressModel = AddressModel.fromJson( data );
        return addressModel;
      }

    }

    return AddressModel(id: -1, content: '', postal: '', note: '', selected: false);

  }

  static Future<AddressModel> getAddressById( int addressId ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/fetch_address_by_id');
    var body = json.encode({
      'address_id' : addressId
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
        var data = jsonDecode(responseBody)['data'];
        AddressModel addressModel = AddressModel.fromJson( data );
        return addressModel;
      }

    }

    return AddressModel(id: 0, content: '', postal: '', note: '', selected: false);

  }


  static addOrEditAddress( addressModel ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/add_or_edit_address');

    var body = jsonEncode({
      "address_details": addressModel,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

  }

  static setSelectedAddress( addressId ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/set_selected_address');

    var body = jsonEncode({
      "address_id": addressId,
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
         return true;
      }
    }
  return false;
  }

  static deleteAddress( addressId ) async {
    final uri = Uri.parse(Config().apiBaseUrl + 'account/address/delete_address');

    var body = jsonEncode({
      "address_id": addressId,
    });

    Map<String,String> headers = {
      'Content-type' : 'application/json',
      'Accept': 'application/json',
      'authorizationkinsgmart' : await Config.getToken()
    };

    Response response = await http.post(uri, body: body, headers: headers);
    int statusCode = response.statusCode;
    String responseBody = response.body;

  }

}