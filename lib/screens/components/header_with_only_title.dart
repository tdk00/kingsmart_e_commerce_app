import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeaderWithOnlyTitle extends StatelessWidget {
  final String title;
  const HeaderWithOnlyTitle({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SizedBox(
      height: height1 / 8,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(),
            Padding(
              padding: EdgeInsets.only(left: screenWidth / 15.43, right: screenWidth / 15.43,),
              child: Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(title,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 20.43,
                              ),
                              color: Colors.white),),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          child: Icon(
                            Icons.shopping_bag_outlined,
                            color: Colors.white,
                            size: 23,
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, "/shoppingCartScreen");
                          },
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
    );
  }
}