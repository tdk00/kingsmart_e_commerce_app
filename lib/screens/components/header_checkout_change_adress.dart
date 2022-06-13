import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/address_model.dart';
import 'package:kingsmart_online_app/screens/account/account_main.dart';
import 'package:kingsmart_online_app/screens/checkout/address_selection.dart';
import 'package:kingsmart_online_app/screens/checkout/change_adress_checkout.dart';
import 'package:kingsmart_online_app/screens/main/snake_navigation.dart';
import 'package:kingsmart_online_app/services/account/address_service.dart';
import 'package:provider/provider.dart';

import '../account/add_adress.dart';
import '../account/address.dart';

class HeaderCheckoutChangeAddress extends StatelessWidget {
  final String title;
  final bool? showShoppingCartIcon;
  final bool? backToAddressSelection;
  const HeaderCheckoutChangeAddress({Key? key, required this.title, this.showShoppingCartIcon, this.backToAddressSelection }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SizedBox(
      height: height1 / 8,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: screenWidth / 15.43, right: screenWidth / 15.43,),
              child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Icon( Icons.arrow_back_ios, color: Colors.white, size: screenWidth / 20.43 ),
                          ),
                          onPressed: () {
                            if( backToAddressSelection == true )
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => AddressSelection()));
                            }
                            else
                            {
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => ChangeAddressCheckoutFuture()));
                            }

                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(title,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 20.43,
                              ),
                              color: Colors.white),),
                      ),
                    ),
                    Expanded(
                        flex: 2,
                        child: Align()
                    ),
                    Expanded(
                        flex: 3,
                        child: SizedBox(),
                    ),
                  ]),
            ),
          ]),
    );
  }
}