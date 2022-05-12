import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/pages/login/login_type_phone.dart';

class LoginTypeSelection extends StatelessWidget {
  const LoginTypeSelection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFBEDDF),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 18),
              child: Text(
                "Giriş formanı seç",
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    color: Color(0xFF000000),
                    textStyle: TextStyle(
                        fontSize: MediaQuery.of(context).size.width / 15.7),
                    fontWeight: FontWeight.w600),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 3.45,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 3.125,
                        height: MediaQuery.of(context).size.width / 3.125,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: CustomColors().kingsOrange,
                              onPrimary: CustomColors().kingsOrange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: Tab(
                              icon: Image(
                                image: AssetImage(
                                  'assets/images/card_login.png',
                                ),
                              ),
                            ),
                            onPressed: () {
                            }),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 39.75),
                        child: Text(
                          "Müştəri kart nömrəsi \n ilə giriş",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width /
                                    25.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width / 65),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 3.125,
                          height: MediaQuery.of(context).size.width / 3.125,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: CustomColors().kingsOrange,
                                onPrimary: CustomColors().kingsOrange,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0),
                                ),
                              ),
                              child: Container(
                                child: SizedBox(
                                  height:
                                  MediaQuery.of(context).size.width /
                                      3.125,
                                  child: Tab(
                                    icon: Container(
                                      child: Image(
                                        image: AssetImage(
                                          'assets/images/phone_login.png',
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (_) => LoginTypePhone()));
                              }),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * .4,
                        padding: EdgeInsets.only(
                            top: MediaQuery.of(context).size.width / 39.75),
                        child: Text(
                          "Yeni müştəri kimi \n giriş",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width /
                                    25.7),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}