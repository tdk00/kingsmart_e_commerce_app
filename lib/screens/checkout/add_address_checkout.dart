import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/profile_model.dart';
import 'package:kingsmart_online_app/screens/checkout/change_adress_checkout.dart';
import 'package:kingsmart_online_app/screens/components/header_addresses.dart';
import 'package:kingsmart_online_app/screens/components/header_checkout_change_adress.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/components/header_with_only_title.dart';
import 'package:kingsmart_online_app/services/account/address_service.dart';
import 'package:kingsmart_online_app/services/account/profile_service.dart';
import 'package:provider/provider.dart';
import '../../Color.dart';
import '../../models/address_model.dart';

class AddAddressCheckout extends StatelessWidget {

  AddressModel addressModel;
  AddAddressCheckout( { required this.addressModel });
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddressModel>.value(
        value: addressModel, child: Body());
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    AddressModel addressModel = Provider.of<AddressModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(children: [
          Container(
            height: height1 / 12,
            color: CustomColors().kingsRed,
            child: HeaderCheckoutChangeAddress(title: "Yeni Ünvan", showShoppingCartIcon: false,),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                  EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = addressModel.content
                      ..selection = TextSelection.collapsed(
                          offset: addressModel.content.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Ünvan*'),
                    onChanged: (String value) {
                      addressModel.changeAddress(value);
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = addressModel.postal
                      ..selection = TextSelection.collapsed(
                          offset: addressModel.postal.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Poçt Kodu*'),
                    onChanged: (String value) {
                      addressModel.changePostalCode(value);
                    },
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
                  child: Text("Çatdırılma üçün xüsusi bir təlimatınız varmı ?",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: screenWidth / 28,
                          ),
                          color: Colors.black)),
                ),
                Padding(
                  padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                  child: TextFormField(
                    controller: TextEditingController()
                      ..text = addressModel.note
                      ..selection = TextSelection.collapsed(
                          offset: addressModel.note.length),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                            BorderRadius.all(Radius.circular(10.0))),
                        hintText: 'Əlavə məlumatlar'),
                    onChanged: (String value) {
                      addressModel.changeNote(value);
                    },
                  ),
                ),
                SizedBox(
                  width: screenWidth,
                  height: height1 / 9,
                  child: Padding( padding: EdgeInsets.only(left: screenWidth / 25, top: height1 / 40, right: screenWidth / 25),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(10.0))),
                      color: Colors.red,
                      child: Text("YADDA SAXLA",
                          textAlign: TextAlign.left,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle( fontSize: screenWidth / 25 ),
                              color: Colors.white)),
                      onPressed: () async {
                        FocusManager.instance.primaryFocus?.unfocus();
                        if( addressModel.content.length < 5 )
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Zəhmət olmasa ünvan yazın'), backgroundColor: Colors.red,),
                          );
                          return;
                        }

                        if( addressModel.postal.length < 3 )
                        {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Zəhmət olmasa poçt kodu yazın'), backgroundColor: Colors.red,),
                          );
                          return;
                        }

                        await AddressService.addOrEditAddress( addressModel );
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChangeAddressCheckoutFuture()));

                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}