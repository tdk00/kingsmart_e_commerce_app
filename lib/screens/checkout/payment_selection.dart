import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:provider/provider.dart';

import '../../Color.dart';
import '../../models/shopping_cart_model.dart';

class PaymentSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container( height: height1 / 12,color: CustomColors().kingsRed, child: HeaderWithBack(title: 'Ödəmə forması', showShoppingCartIcon: false ) ),
            Padding(
              padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 20),
              child: Text("Qapıda ödəmə",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 26,
                      ),
                      color: Colors.black)),
            ),
            Padding(
                padding:
                EdgeInsets.only(left: screenWidth / 20, top: height1 / 40, right: screenWidth / 20),
                child: OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () async {

                  },
                  child: SizedBox(
                    height: height1 / 12,
                    width: screenWidth,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Sifarişi aldıqdan sonra nağd ödəmək",
                              textAlign: TextAlign.left,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: screenWidth / 30,
                                  ),
                                  color: Colors.black)),
                          Container(
                              width: screenWidth / 20,
                              child: Image.asset("assets/buttons/arrow.png"))
                        ],
                      ),
                    ),
                  ),
                ),
            ),
            Padding(
                padding: EdgeInsets.only(left: screenWidth / 21, top: height1 / 30, right: screenWidth / 15),
                child: SizedBox(
                  width: screenWidth,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Məbləğ",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.black)),
                        Text(shoppingCart.basketTotalMoney.toString() + " ₼",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.black)),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: screenWidth / 21, top: height1 / 60, right: screenWidth / 15),
                child: SizedBox(
                  width: screenWidth,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Çatdırılma məbləği",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.black)),
                        Text("0.00" + " ₼",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 26,
                                ),
                                color: Colors.black)),
                      ],
                    ),
                  ),
                )),
            Padding(
                padding: EdgeInsets.only(left: screenWidth / 21, top: height1 / 30, right: screenWidth / 15),
                child: SizedBox(
                  width: screenWidth,
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Toplam",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 25,
                                ),
                                color: Colors.black)),
                        Text(shoppingCart.basketTotalMoney.toString() + " ₼",
                            textAlign: TextAlign.left,
                            style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.bold,
                                textStyle: TextStyle(
                                  fontSize: screenWidth / 25,
                                ),
                                color: Colors.black)),
                      ],
                    ),
                  ),
                )),

          ],
        ),
      ),
    );
  }
}
