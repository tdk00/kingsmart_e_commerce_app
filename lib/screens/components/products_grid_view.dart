import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/product_card.dart';
import 'package:provider/provider.dart';


class ProductGridView extends StatelessWidget {
  final String? title;
  final List<ProductModel> productList;
  const ProductGridView({Key? key,this.title, required this.productList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Column(
      children: [
        title != null ?
        Container(
          padding: EdgeInsets.only(left: screenWidth / 18.43,),
        alignment: Alignment.topLeft,
        child:
        Container(
          margin: EdgeInsets.only(bottom: height1 / 30 ),
          child: Text( title ?? "",
          style: GoogleFonts.montserrat( textStyle: TextStyle( fontSize: screenWidth / 22.43, ),
              color: Colors.black),),
        ),
        )
            :
        Container(),
        Expanded(
          child: Stack(
          children: [
            Container(
              padding: EdgeInsets.only(left: screenWidth / 18.43),
              child: GridView.builder(
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
          ],
      ),
        ),
    ]
    );
  }
}