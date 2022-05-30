import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../models/shopping_cart_model.dart';

class AddToCartWidget extends StatelessWidget {
  ProductModel productModel;
  bool shoppingCartView;
  AddToCartWidget({ required this.productModel, required this.shoppingCartView});
  @override
  Widget build(BuildContext context) {
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    int quantityInBasket = shoppingCart.getQuantityInShoppingCart( productModel );
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return quantityInBasket < 1
        ?  SizedBox(
      width: screenWidth / 2.8,
      height: ! shoppingCartView ? height1 / 16.7 : height1 / 26.7,
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey.shade200, width: 1),
              borderRadius: BorderRadius.circular(
                  screenWidth / 51.5),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: ! shoppingCartView ? EdgeInsets.only(top: height1 / 55 ) : EdgeInsets.only(top: height1 / 90 ),
                  child: Text(
                    "Əlavə Et",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize:  ! shoppingCartView ? screenWidth / 26.43 : screenWidth / 36.43,
                        ),
                        color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
          onPressed: () {
            shoppingCart.increaseProduct(productModel);
          }),
    )
        : Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
              screenWidth / 51.5),
          border: Border.all(
            color: Colors.grey.shade200,
          )),
      width: screenWidth / 2.8,
      height: height1 / 20.7,
      child: Row(
        children: [
          Expanded(
            child: MaterialButton(
              onPressed: () {
                shoppingCart.decreaseProduct(productModel);
              },
              child: Text("-",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize:
                        ! shoppingCartView ?  screenWidth / 15 : screenWidth / 19,
                      ),
                      color: Colors.black)),
            ),
          ),
          Expanded(
            child: Text(Provider.of<ShoppingCartModel>(context).getQuantityInShoppingCart(productModel).toString(),
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize:
                      ! shoppingCartView ?  screenWidth / 26.43 :  screenWidth / 36.43,
                    ),
                    color: Colors.black)),
          ),
          Expanded(
            child: MaterialButton(
              onPressed: () {
                shoppingCart.increaseProduct(productModel);
              },
              child: Text("+",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize:
                        ! shoppingCartView ?  screenWidth / 15 : screenWidth / 19,
                      ),
                      color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}