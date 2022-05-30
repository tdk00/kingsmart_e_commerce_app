import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeaderWithLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SizedBox(
      height: height1 / 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          children: [
        SizedBox(),
        Row( mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox( width: screenWidth / 3.7527, ) ,
              SizedBox(
                width: screenWidth / 3.125,
                child: Image.asset("assets/images/logo.png", fit: BoxFit.fitWidth,),
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
                  Navigator.pushNamed(context, "/shoppingCartScreen");
                },
              ),
            ]),
      ]),
    );
  }
}