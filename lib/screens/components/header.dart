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
    ShoppingCartModel shoppingCart = Provider.of<ShoppingCartModel>(context);
    return Column(children: [
      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        ! showLogo ? SizedBox(
          width: MediaQuery.of(context).size.width / 3.7527,
          child: GestureDetector(
            child: Container(
              alignment: Alignment.topLeft,
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 27.4),
              child: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 23,
              ),
            ),
            onTap: () {

            },
          ),
        )
            :
        SizedBox( width: MediaQuery.of(context).size.width / 3.7527, ) ,
        showLogo ? Container(
          width: MediaQuery.of(context).size.width / 3.125,
          margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 27.4),
          child: Image.asset("assets/images/logo.png"),
        ):
        Container(
          width: MediaQuery.of(context).size.width / 3.125,
          margin:
          EdgeInsets.only(top: MediaQuery.of(context).size.height / 27.4),
          alignment: Alignment.topCenter,
          child: Text(title,
              textAlign: TextAlign.left,
              style: GoogleFonts.montserrat(
                  textStyle: TextStyle(
                    fontSize: MediaQuery.of(context).size.width / 20.43,
                  ),
                  color: Colors.white),),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 5,
        ),
        GestureDetector(
          child: Container(
            margin:
            EdgeInsets.only(top: MediaQuery.of(context).size.height / 27.4),
            child: Icon(
              Icons.shopping_bag_outlined,
              color: Colors.white,
              size: 23,
            ),
          ),
          onTap: () {

          },
        ),
      ]),
      SizedBox(
        height: MediaQuery.of(context).size.height / 35,
      ),
      Container(
        padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width / 17.4,
            right: MediaQuery.of(context).size.width / 17.4),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          width: MediaQuery.of(context).size.width / 1.13,
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
                contentPadding: EdgeInsets.only(left: 15, top: 14),
                hintText: "Nə axtarırsan?"),
          ),
        ),
      ),
      SizedBox(
        height: MediaQuery.of(context).size.height / 55,
      ),
    ]);
  }
}