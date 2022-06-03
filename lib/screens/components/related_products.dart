import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/product_card.dart';
import 'package:kingsmart_online_app/screens/components/products_grid_view.dart';
import 'package:kingsmart_online_app/services/product_service.dart';
import 'package:provider/provider.dart';

import '../../services/category_service.dart';


class RelatedProducts extends StatelessWidget {
  final ProductModel productModel;
  RelatedProducts( { required this.productModel } );

  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<ProductModel>>.value(
      value: ProductService.getRelatedProductsById( productModel ), initialData: [],
      child: Body()
    );

  }
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    List<ProductModel> productList = Provider.of<List<ProductModel>>(context);
    return Column(
      children: [
        Expanded(flex: 2,child: SizedBox()),
        Expanded(
          flex: 6 ,
          child: Container(
            padding: EdgeInsets.only(left: screenWidth / 18.43,),
            alignment: Alignment.topLeft,
            child:
            Container(
              child: Text( "Digər məhsullar",
                style: GoogleFonts.montserrat( textStyle: TextStyle( fontSize: screenWidth / 22.43, ),
                    color: Colors.black),),
            ),
          ),
        ),
        Expanded(
          flex: 40,
          child: Container(
          padding: EdgeInsets.only(left: screenWidth / 18.43),
          child: GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: productList.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.60,),
            itemBuilder: (context, i) {
              return ChangeNotifierProvider<ProductModel>.value(
                value: productList[i],
                child: ProductCard(productModel: productList[i]),
              );
            },
          ),
      ),
        ),
    ]
    );
  }
}