import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../models/favorite_products_model.dart';

class FavoriteProducts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    FavoriteProductsModel model = Provider.of<FavoriteProductsModel>(context);
    if( model.favoriteProducts.isEmpty ){
      return Container();
    }
    return Container(
      height: height1 / 2,
      color: Color(0xFFFFF9F3),
      padding: EdgeInsets.only(
          left: screenWidth / 23.4,
          right: screenWidth / 17.4),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 2,
            child: Row(
              children: [
                Text(
                  "Bəyəndiyin məhsullar",
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 22.43,
                      ),
                      color: Colors.black),
                ),
                Expanded(child: Container()),
                GestureDetector(
                  onTap: () {

                  },
                  child: Text(
                    "Hamısı",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 22.43,
                        ),
                        color: Colors.red),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              width: screenWidth,
              height:  MediaQuery.of(context).size.height * .04,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.favoriteProducts.length ,
                  itemBuilder: (context, i) {
                    return ChangeNotifierProvider<ProductModel>.value(
                      value: model.favoriteProducts[i],
                      child: ProductCard(productModel: model.favoriteProducts[i]),
                    );
                  }),

            ),
          ),

        ],
      ),
    );
  }
}