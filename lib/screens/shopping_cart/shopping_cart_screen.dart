import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:kingsmart_online_app/screens/checkout/address_selection.dart';
import 'package:kingsmart_online_app/screens/shopping_cart/shopping_cart_item.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../services/shopping_cart_service.dart';

class ShoppingCartScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
      return ChangeNotifierProvider<ShoppingCartModel>.value(value: shoppingCart, child: Body(),);
  }
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    var shoppingCartListKeys = shoppingCart.shoppingCartItems.keys.toList();
    ShoppingCartService.updateShoppingCart( shoppingCart, forceUpdate: true );
    if( shoppingCart.shoppingCartItems.length == 0 )
    {
      return ShoppingCartEmpty();
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFF9F3),
        body: Column(
          children: [
          Container(
            color: CustomColors().kingsRed,
            child: SizedBox(
            height: height1 / 13,
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
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 10,
                            child: Align(
                              alignment: Alignment.center,
                              child: Text('Səbət',
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 20.43,
                                    ),
                                    color: Colors.white),),
                            ),
                          ),
                          Expanded(
                              flex: 3,
                              child: SizedBox()
                          ),
                        ]),
                  ),
                ]),
        ),
          ),
            Expanded(
              flex: 1,
              child: Container(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 20, bottom: 20),
                  child: Text(
                    "Səbətdəki Məhsullar",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 25,
                        ),
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.separated(
                primary: false,
                shrinkWrap: true,
                clipBehavior: Clip.antiAlias,
                separatorBuilder: (BuildContext context, int index) =>
                    Container(
                      width: screenWidth,
                      height: 2.0,
                      color: Color(0xFFCDCDCF),
                    ),
                itemCount: shoppingCartListKeys.length,
                itemBuilder: (context, i) {
                  return ChangeNotifierProvider<ProductModel>.value(
                    value: shoppingCartListKeys[i],
                    child: ShoppingCartItem(productModel: shoppingCartListKeys[i]),
                  );
                },
              ),
            ),
            Expanded(flex: 2,child: CartDetails()),
            Expanded(flex: 2,child: BottomPart())

          ],
        ),
      ),
    );
  }
}




class ShoppingCartEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
return SafeArea(
  child:   Scaffold(
    backgroundColor: Color(0xFFFFF9F3),

    body: Column(

      children: [

        Container(

          color: CustomColors().kingsRed,

          child: SizedBox(

            height: height1 / 13,

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

                                  Navigator.pop(context);

                                },

                              ),

                            ),

                          ),

                          Expanded(

                            flex: 10,

                            child: Align(

                              alignment: Alignment.center,

                              child: Text('Səbət',

                                style: GoogleFonts.montserrat(

                                    textStyle: TextStyle(

                                      fontSize: screenWidth / 20.43,

                                    ),

                                    color: Colors.white),),

                            ),

                          ),

                          Expanded(

                              flex: 3,

                              child: SizedBox()

                          ),

                        ]),

                  ),

                ]),

          ),

        ),


        SizedBox(
          height: 150,
        ),

        SizedBox(

          width: 150,

          height: 150,

          child: Image.asset("assets/layers/shoppingCart.png"),

        ),

        Padding(

          padding: const EdgeInsets.all(8.0),

          child: Text("Hələ ki səbətinə əlavə edilmiş məhsul yoxdur",

              textAlign: TextAlign.left,

              style: GoogleFonts.montserrat(

                  textStyle: TextStyle(

                    fontSize: MediaQuery.of(context).size.width / 27,

                  ),

                  color: Colors.grey)),

        ),

        Padding(

            padding: const EdgeInsets.all(13.0),

            child: Container(

              height: 55,

              decoration: BoxDecoration(

                color: Colors.white,

                borderRadius: BorderRadius.circular(

                    MediaQuery.of(context).size.width / 51.5),

              ),

              width: MediaQuery.of(context).size.width,

              child: MaterialButton(

                shape: RoundedRectangleBorder(

                    borderRadius:

                    BorderRadius.all(Radius.circular(10.0))),

                color: Colors.red,

                child: Text("ALIŞ VERİŞƏ BAŞLAYIN",

                    textAlign: TextAlign.left,

                    style: GoogleFonts.montserrat(

                        textStyle: TextStyle(

                          fontSize:

                          MediaQuery.of(context).size.width /

                              27,

                        ),

                        color: Colors.white)),

                onPressed: () {

                  Navigator.pop(context);

                },

              ),

            )),

      ],

    ),

  ),
);
  }
}

class CartDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: SizedBox(),
        ),
        Expanded(
          flex: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                shoppingCart.shoppingCartItems.length.toString() +
                    " məhsul",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat( textStyle: TextStyle( fontWeight: FontWeight.bold,
                      fontSize: screenWidth / 24,
                    ),
                    color: Colors.black),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      "Məbləğ",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            //fontWeight: FontWeight.bold,
                            fontSize:
                            screenWidth / 25,
                          ),
                          color: Colors.black),
                    ),
                  ),
                  Expanded(flex: 4, child: Container()),
                  Expanded(
                    flex: 2,
                    child: Text(
                      shoppingCart.basketTotalMoney.toStringAsFixed(2) + " ₼",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize:
                            screenWidth / 25,
                          ),
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox( height: 8),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Text(
                      "Çatdırılma məbləği",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 25,
                          ),
                          color: Colors.black),
                    ),
                  ),
                  Expanded(flex: 3,child: SizedBox()),
                  Expanded(
                    flex: 2,
                    child: Text(
                      "0.00" + " ₼",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 25,
                          ),
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

class BottomPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.7),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        height: 90,
        width: screenWidth,
        child: Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Toplam",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 25,
                      ),
                      color: Colors.black),
                ),
                Text(
                  shoppingCart.basketTotalMoney.toString() + " ₼",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 25,
                      ),
                      color: Colors.black),
                ),
                SizedBox(
                  height: 8,
                )
              ],
            ),
            Expanded(child: Container()),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 60,
                width: 170,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                  color: Colors.red,
                  child: Text("Davam et",
                      textAlign: TextAlign.left,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            fontSize: screenWidth / 27,
                          ),
                          color: Colors.white)),
                  onPressed: () async {
                    await ShoppingCartService.updateShoppingCart( shoppingCart );
                      Navigator.push(context, MaterialPageRoute(builder: (_) => AddressSelection()));
                  },
                ),
              ),
            ),
            SizedBox(
              width: 20,
            )
          ],
        ),
        //color: Colors.red,
      ),
    );
  }
}


