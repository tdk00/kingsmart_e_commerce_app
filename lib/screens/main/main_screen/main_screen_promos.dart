import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../models/promo_products_model.dart';

class MainScreenPromos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    PromoProductsModel model = Provider.of<PromoProductsModel>(context);
    if( model.promoProducts.isEmpty ){
      return Container();
    }
    return Container(
      height: height1 / 2,
      padding: EdgeInsets.only(
          left: screenWidth / 23.4,
          right: screenWidth / 17.4),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Daha çox qənaət et",
                textAlign: TextAlign.left,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: screenWidth / 22.43,
                    ),
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: SizedBox(
              width: screenWidth,
              height:  MediaQuery.of(context).size.height * .04,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: model.promoProducts.length ,
                  itemBuilder: (context, i) {
                    return ChangeNotifierProvider<ProductModel>.value(
                      value: model.promoProducts[i],
                      child: ProductCard(productModel: model.promoProducts[i]),
                    );
                  }),

            ),
          ),

        ],
      ),
    );
  }
}