import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/shopping_cart_model.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  final showLogo;
  final title;
  Header(this.showLogo, this.title);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return SizedBox(
      height: height1 / 4.45,
      child: Column(children: [
        Expanded(flex: 34,child: SizedBox()),
        Expanded(
          flex: 48,
          child: Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
            ! showLogo ? SizedBox(
              width: screenWidth / 3.7527,
              child: GestureDetector(
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Icon( Icons.arrow_back_ios, color: Colors.white, size: 23 ),
                ),
                onTap: () {

                },
              ),
            )
                :
            SizedBox( width: screenWidth / 3.7527, ) ,
            showLogo ? SizedBox(
              width: screenWidth / 3.125,
              child: Image.asset("assets/images/logo.png", fit: BoxFit.fitWidth,),
            ):
            Container(
              width: screenWidth / 3.125,
              alignment: Alignment.topCenter,
              child: Text(title,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 20.43,
                      ),
                      color: Colors.white),),
            ),
            SizedBox(
              width: screenWidth / 5,
            ),
            GestureDetector(
              child: Icon(
                Icons.shopping_bag_outlined,
                color: Colors.white,
                size: 23,
              ),
              onTap: () {

              },
            ),
          ]),
        ),
        Expanded(flex: 22,child: SizedBox()),
        Expanded(
          flex: 40,
          child: Container(
            padding: EdgeInsets.only(
                left: screenWidth / 17.4,
                right: screenWidth / 17.4),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              width: screenWidth / 1.13,
              child: TextField(
                onSubmitted: ( String value ) {
                },
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15, top: height1 / 60),
                    hintText: "Nə axtarırsan?"),
              ),
            ),
          ),
        ),
        Expanded(flex : 11,child: SizedBox()),
      ]),
    );
  }
}