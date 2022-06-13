import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/components/shopping_cart_item_count_dot.dart';

class HeaderWithBack extends StatelessWidget {
  final String title;
  final bool? showShoppingCartIcon;
  final bool? showDeleteIcon;
  final double? customTitleFontSize;
  const HeaderWithBack({Key? key, required this.title, this.showShoppingCartIcon, this.showDeleteIcon, this.customTitleFontSize}) : super(key: key);
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
                      flex: 3,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          child: Container(
                            alignment: Alignment.topLeft,
                            child: Icon( Icons.arrow_back_ios, color: Colors.white, size: screenWidth / 20.43 ),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 10,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(title,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: customTitleFontSize ?? screenWidth / 20.43,
                              ),
                              color: Colors.white),),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: showShoppingCartIcon != false ? Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                          child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(
                                  Icons.shopping_bag_outlined,
                                  color: Colors.white,
                                  size: 23,
                                ),
                                BuildDot()
                              ]
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, "/shoppingCartScreen");
                          },
                        ),
                      )
                          :
                          showDeleteIcon == true
                              ?
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                                size: 23,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, "/shoppingCartScreen");
                              },
                            ),
                          )
                              :
                          SizedBox()
                    ),
                  ]),
            ),
          ]),
    );
  }
}