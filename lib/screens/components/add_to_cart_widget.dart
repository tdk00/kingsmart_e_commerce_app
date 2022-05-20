import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../models/shopping_cart_model.dart';

class AddToCartWidget extends StatelessWidget {
  ProductModel productModel;
  AddToCartWidget({ required this.productModel});
  @override
  Widget build(BuildContext context) {
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    int quantityInBasket = shoppingCart.getQuantityInShoppingCart( productModel );
    return quantityInBasket < 1
        ?  SizedBox(
      width: MediaQuery.of(context).size.width / 2.8,
      child: OutlinedButton(
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.white,
            shape: RoundedRectangleBorder(
              side: BorderSide(
                  color: Colors.grey.shade200, width: 1),
              borderRadius: BorderRadius.circular(
                  MediaQuery.of(context).size.width / 51.5),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Əlavə Et",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context)
                              .size
                              .width /
                              26.43,
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
              MediaQuery.of(context).size.width / 51.5),
          border: Border.all(
            color: Colors.grey.shade200,
          )),
      width: MediaQuery.of(context).size.width / 2.8,
      height: MediaQuery.of(context).size.width / 11.7,
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
                        MediaQuery.of(context).size.width /
                            15,
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
                      MediaQuery.of(context).size.width /
                          26.43,
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
                        MediaQuery.of(context).size.width /
                            15,
                      ),
                      color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
}