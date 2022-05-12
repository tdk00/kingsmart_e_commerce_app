import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/pages/main/snake_navigation.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';

import '../../services/authentication/authentication.dart';

class Otp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFBEDDF),
        resizeToAvoidBottomInset: true,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 18),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 25),
                      child: ClipOval(
                        child: Material(
                          color: Color(0xFFFDEFE9), // button color
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width / 9.3,
                              height: MediaQuery.of(context).size.width / 9.3,
                              child: SizedBox(
                                child: Icon(
                                  Icons.arrow_back_ios_outlined,
                                  color: CustomColors().kingsRed,
                                  size:
                                  MediaQuery.of(context).size.width / 31.25,
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width / 11.4),
                      child: Text(
                        "Nömrə təsdiqləmə",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 15.7),
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 6.1),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 3.23,
                  height: MediaQuery.of(context).size.width / 3.23,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: CustomColors().kingsOrange,
                        onPrimary: CustomColors().kingsOrange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              MediaQuery.of(context).size.width / 1.5),
                        ),
                      ),
                      child: Container(
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width / 3.125,
                          child: Tab(
                            icon: Container(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/otp.png',
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      onPressed: () {}),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 39.75),
                child: Text(
                  "Telefona gələn OTP kodu daxil edin",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 23.43),
                      color: CustomColors().kingsOrange),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 24),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.35,
                  child: OTPTextField(
                    length: 4,
                    width: MediaQuery.of(context).size.width / 1.35,
                    fieldWidth: MediaQuery.of(context).size.width / 6.5,
                    style: TextStyle(fontSize: 17),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    fieldStyle: FieldStyle.box,
                    onCompleted: (pin) async {
                      bool confirmed = await Authentication.confirmOtp( pin );
                      if( confirmed )
                      {
                        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_) =>  SnakeNavigation()), (route) => false);
                      }
                      else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('OTP səhvdir və ya vaxtı bitmişdir'), backgroundColor: Colors.red,),
                        );
                      }

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}