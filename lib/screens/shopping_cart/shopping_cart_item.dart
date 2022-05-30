import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:provider/provider.dart';

import '../../services/config.dart';
import '../components/add_to_cart_widget.dart';

class ShoppingCartItem extends StatelessWidget {
  ProductModel productModel;
  ShoppingCartItem({ required this.productModel });
  @override
  Widget build(BuildContext context) {

    print("shopping cart item rebuilt");
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    int quantityInBasket = shoppingCart.getQuantityInShoppingCart( productModel );
    return Container(
      height: height1 / 7,
      padding: EdgeInsets.only(left: 40, top: 20),
      child: Column(
        children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Container(
                    height: height1 / 10,
                    child: Image(image: NetworkImage(
                      Config().apiBaseUrl + productModel.image
                    ),
                    fit: BoxFit.fitWidth,),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Text(
                      productModel.title.length > 30 ? productModel.title.substring(0, 30) : productModel.title,
                      style: TextStyle(
                        fontSize: 14
                      ),
                    ),
                      SizedBox(height: height1 / 40),
                      SizedBox(width: screenWidth / 3.6, child: AddToCartWidget(productModel: productModel, shoppingCartView: true,)),
                    ]
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Column(
                    children: [
                      Text( (productModel.price * quantityInBasket).toString() + " ₼",
                        style: TextStyle(
                          color: Colors.red,
                            fontSize: 14,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      Text( productModel.price.toString() + " ₼",
                        style: TextStyle(
                          color: Colors.red,
                            fontSize: 12,
                        ),

                      ),
                      productModel.discount > 0 ?
                      Text( productModel.oldPrice.toString() + " ₼",
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          fontSize: 12,
                        ),
                      ) : SizedBox()
                      ,
                      Padding(
                        padding: const EdgeInsets.only(left: 0.0),
                        child: GestureDetector(
                          onDoubleTap: () {
                            shoppingCart.deleteProductFromShoppingCart(productModel);
                          },
                          child: Container(
                            width: 30,
                            height: MediaQuery.of(context).size.width / 13,
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                child: Image.asset(
                                  "assets/buttons/bin.png",
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }
}