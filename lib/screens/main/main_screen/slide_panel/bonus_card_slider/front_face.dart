import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../../models/bonus_cart.dart';

class FrontFace extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BonusKart bonusKart = Provider.of<BonusKart>(context);
    return Card(
      semanticContainer: true,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))),
      elevation: 2,
      margin: EdgeInsets.all(10),
      child: Stack(
        children: [
          Image(
            image: AssetImage('assets/layers/cardLayer.png'),
            alignment: Alignment.center,
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          Container(
            padding: EdgeInsets.only(
                left: MediaQuery
                    .of(context)
                    .size
                    .width / 18.7,
                top: MediaQuery
                    .of(context)
                    .size
                    .width / 18.7),
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          "İstifadəçi id",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 14,
                              ),
                              color: Colors.grey),
                        ),
                        Text(
                          bonusKart.cardCode,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: 15,
                              ),
                              fontWeight: FontWeight.w500,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery
                              .of(context)
                              .size
                              .width / 38.7),
                      child: Column(
                        children: [
                          Text(
                            "Bonus məbləği",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                ),
                                color: Colors.grey),
                          ),
                          Text(
                            (double.parse(bonusKart.balans)*10).toStringAsFixed(2),
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 15,
                                ),
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width / 6.6,
                          height: MediaQuery
                              .of(context)
                              .size
                              .width / 13.6,
                          padding: EdgeInsets.only(
                              left: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 87.5,
                              right: 0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.rectangle,
                              borderRadius:
                              BorderRadius.all(Radius.circular(5))),
                          child: Container(
                            padding: EdgeInsets.only(
                                right:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 87.5),
                            child: Row(
                              children: [
                                Container(
                                  child: Image(
                                    image: AssetImage(
                                      "assets/images/card_medal.png",
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Sadə",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                          fontSize: MediaQuery
                                              .of(context)
                                              .size
                                              .width /
                                              45,
                                        ),
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Container(
                          child: Column(
                            children: [
                              Container(
                                width:
                                MediaQuery
                                    .of(context)
                                    .size
                                    .width / 2.2,
                                height: 6,
                                child: LinearProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<
                                        Color>(
                                        Colors.black),
                                    value: double.parse(
                                        bonusKart.balans) /
                                        100,
                                    backgroundColor: Color(
                                        0xFFA9000E)),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 14.0, top: 10),
                                child: Row(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment
                                      .start,
                                  children: [
                                    Container(
                                      child: Text(
                                        bonusKart.balans +
                                            "/ 100 azn",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              fontSize: 12,
                                            ),
                                            fontWeight: FontWeight
                                                .w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                    Expanded(child: Container()),
                                    Padding(
                                      padding:
                                      const EdgeInsets.only(
                                          right: 14.0),
                                      child: Container(
                                        child: Text(
                                          "Elit",
                                          style: GoogleFonts
                                              .montserrat(
                                              textStyle: TextStyle(
                                                fontSize: 12,
                                              ),
                                              fontWeight: FontWeight
                                                  .w500,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),

          ),

        ],
      ),
    );
  }
}