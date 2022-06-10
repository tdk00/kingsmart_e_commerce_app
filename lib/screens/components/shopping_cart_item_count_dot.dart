import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../models/shopping_cart_model.dart';
class BuildDot extends StatelessWidget {
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
    var num = shoppingCart.shoppingCartItems.length;
    if (num > 0) {
      return Positioned(
          left: 15,
          child: Padding(
            padding: EdgeInsets.all(0.0),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xFFFF8A23),
                shape: BoxShape.circle,
              ),
              height: screenWidth / 33,
              width: screenWidth / 33,
              child: Center(
                child: Text(num.toString(),
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 45,
                        ),
                        color: Colors.white)),
              ),
            ),
          ));
    } else {
      return SizedBox();
    }
  }
}