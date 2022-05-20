import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/product_card.dart';
import 'package:provider/provider.dart';

import '../../../models/promo_products_model.dart';

class MainScreenPromos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("promo widg");
    PromoProductsModel model = Provider.of<PromoProductsModel>(context);
    if( model.promoProducts.isEmpty ){
      return Expanded(flex: 0, child: Container());
    }
    return Expanded(
      flex: 287,
      child: Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 23.4,
            right: MediaQuery.of(context).size.width / 17.4),
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
                        fontSize: MediaQuery.of(context).size.width / 22.43,
                      ),
                      color: Colors.white),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height * .04,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: model.promoProducts.length ,
                    itemBuilder: (context, i) {
                      return ChangeNotifierProvider<ProductModel>(
                        create: (BuildContext context) { return model.promoProducts[i]; },
                        child: ProductCard(productModel: model.promoProducts[i]),
                      );
                    }),

              ),
            ),

          ],
        ),
      ),
    );
  }
}