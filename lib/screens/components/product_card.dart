import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/screens/components/add_to_cart_widget.dart';
import 'package:kingsmart_online_app/screens/store/product_details.dart';
import 'package:kingsmart_online_app/services/favorite_products_service.dart';
import 'package:kingsmart_online_app/services/product_service.dart';
import 'package:provider/provider.dart';

import '../../models/product_model.dart';
import '../../models/promo_products_model.dart';
import '../../models/shopping_cart_model.dart';
import '../../services/config.dart';

class ProductCard extends StatelessWidget {

  ProductModel productModel;

  ProductCard({Key? key, required this.productModel}) : super(key: key);



  Widget build(BuildContext context) {
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return Container(
      margin: EdgeInsets.only(right: 20),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height / 68),
      width: MediaQuery.of(context).size.width / 2.34,
      child: InkWell(
        onTap: () {
          Navigator.push(context,  MaterialPageRoute(builder: (_) => FutureProvider<ProductModel>.value(
              value: ProductService.getProductById( productModel ),
              initialData: productModel,
              child: ProductDetails(productModel: productModel,))));
        },
        child: Container(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width / 42.34, right: MediaQuery.of(context).size.width / 42.34),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Column(
            children: [
              Expanded(
                flex: 10,
                child: ChangeNotifierProvider<ProductModel>.value(
                    value: productModel,
                child: ToggleFavoriteWidget(),)
              ),
              Expanded(
                flex: 35,
                child: Image(
                  fit: BoxFit.fitHeight,
                  image: NetworkImage(
                    Config().apiBaseUrl.toString() + productModel.image.toString(),
                  ),
                ),
              ),
              Expanded(
                flex: 12,
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        productModel.price.toString() + "₼",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize:
                              MediaQuery.of(context).size.width / 26.43,
                            ),
                            color: Colors.red),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 10.43,
                      ),
                    ),
                    productModel.oldPrice > productModel.price ?
                    Expanded(
                      flex: 1,
                      child: Text(
                        productModel.oldPrice.toString() + "₼",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 26.43,
                                decoration: TextDecoration.lineThrough),
                            color: Colors.grey),
                      ),
                    ):
                    Expanded(
                      flex: 1,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 10.43,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 16,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    productModel.title,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 26.43,
                        ),
                        color: Colors.black),
                  ),
                ),
              ),
              Expanded(flex: 12,child: ChangeNotifierProvider.value(
                  value: shoppingCart,
                  child: AddToCartWidget(productModel: productModel, shoppingCartView: false,))),
              Expanded(flex: 5,child: SizedBox())
            ],
          ),
        ),
      ),
    );
  }
}

class ToggleFavoriteWidget  extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    ProductModel productModelProvider = Provider.of<ProductModel>(context);
    FavoriteProductsModel favoriteProductsModel = Provider.of<FavoriteProductsModel>(context);
    PromoProductsModel promoProductsModel = Provider.of<PromoProductsModel>(context);
    return Align(
      alignment: Alignment.topRight,
      child:
      IconButton(
        icon: Icon(
          productModelProvider.isFavorite==true? Icons.favorite : Icons.favorite_border,
          color: productModelProvider.isFavorite==true? Colors.red : Colors.grey,
          size: 20,
        ), onPressed: () async {
        var isFavorite = productModelProvider.isFavorite;
        isFavorite = await FavoriteProductsService.toggleFavoriteStatus(productModelProvider.id, ! isFavorite);

        productModelProvider.toggleIsFavorite( isFavorite );

        favoriteProductsModel.toggleIsFavorite( isFavorite, productModelProvider );
        promoProductsModel.toggleIsFavorite( isFavorite, productModelProvider );
      },
      ),
    );
  }

}