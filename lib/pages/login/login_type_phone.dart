import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/pages/login/otp.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import '../../Color.dart';
import '../../helpers/validators.dart';
import '../../services/authentication/authentication.dart';

class LoginTypePhone extends StatelessWidget {

  final TextEditingController phoneController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  LoginTypePhone({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFBEDDF),
      resizeToAvoidBottomInset: true,
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * .05,
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
                              size: MediaQuery.of(context).size.width / 31.25,
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
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * .05,
                  ),
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
                        child: SizedBox(
                          height: MediaQuery.of(context).size.width / 3.125,
                          child: Tab(
                            icon: Image(
                              image: AssetImage(
                                'assets/images/mobil_login.png',
                              ),
                            ),
                          ),
                        ),
                        onPressed: () {}),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.width / 39.75,
                ),
                child: Text(
                  "Telefon nömrənizi qeyd edin",
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
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: TextFormField(
                    controller: phoneController,
                    inputFormatters: [
                      MaskTextInputFormatter(mask: "+994 (##) ###-##-##"),
                    ],
                    validator: Validators().validateMobile,
                    keyboardType: TextInputType.phone ,
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.fromLTRB(
                            10.0,
                            MediaQuery.of(context).size.width / 13,
                            MediaQuery.of(context).size.width / 13,
                            10.0),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            borderSide: BorderSide(color: Colors.black)),
                        hintText: 'Nömrəni daxil edin'),
                  )
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height / 40,
                ),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.20,
                  height: MediaQuery.of(context).size.width / 1.20 / 5.25,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: CustomColors().kingsRed,
                        onPrimary: CustomColors().kingsRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0),
                        ),
                      ),
                      child: Text(
                        "Giriş",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize:
                                MediaQuery.of(context).size.width / 20.5),
                            fontWeight: FontWeight.w600,
                            color: Colors.white),
                      ),
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          bool created = await Authentication.createOtp( phoneController.text );
                          if( created )
                            {
                              Navigator.push(context,  MaterialPageRoute(builder: (_) => Otp()));
                            }
                          else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Səhv yarandı'), backgroundColor: Colors.red,),
                            );
                          }

                        }
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}