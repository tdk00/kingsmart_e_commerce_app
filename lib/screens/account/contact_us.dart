import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/services/account/contact_us_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Color.dart';
import '../../models/contact_us_model.dart';
import '../components/header_with_back.dart';


class ContactUsFP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureProvider<ContactUsModel>.value(
      value: ContactUsService.getDetails(),
      initialData: ContactUsModel(
          whatsapp: '',
          phone: '',
          email: ''
      ),
      child: Body(),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;

    ContactUsModel contactUsModel = Provider.of<ContactUsModel>(context);


    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container( height: height1 / 10, color: CustomColors().kingsRed , child: HeaderWithBack(title: 'Əlaqə'), ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                  "Kömək lazımdır?\nTəmsilçilərimizlə əlaqə saxlamaq üçün üstünlük\nverdiyiniz metodu seçin",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 28,
                      ),
                      color: Colors.grey)),
            ),
            Expanded(
                flex: 2,
                child: Image.asset("assets/layers/headphone.png")),
            Expanded(
                flex: 1,
                child: Container(
                  height: height1 * .3,
                  width: screenWidth,
                  decoration: BoxDecoration(
                      color: Color(0xFFFFF9F3),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.elliptical(180, 45),
                          topRight: Radius.elliptical(180, 45))),
                  child: Padding(
                    padding: EdgeInsets.only(left: screenWidth / 20, right: screenWidth / 20),
                    child: Row(
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var url = Uri.parse( "whatsapp://send?phone=" + contactUsModel.whatsapp );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: SizedBox(
                                  height: screenWidth / 5,
                                  width: screenWidth / 5,
                                  child: Image.asset(
                                      "assets/buttons/whatsapp.png")),
                            ),
                            Text("Whatsapp",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 28,
                                    ),
                                    color: Colors.black)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var url = Uri.parse( "tel: " + contactUsModel.phone );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: SizedBox(
                                  height: screenWidth / 5,
                                  width: screenWidth / 5,
                                  child:
                                  Image.asset("assets/buttons/call.png")),
                            ),
                            Text("Zəng edin",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 28,
                                    ),
                                    color: Colors.black)),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () async {
                                var url = Uri.parse( "mailto:" + contactUsModel.email );
                                if (await canLaunchUrl(url)) {
                                  await launchUrl(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              },
                              child: SizedBox(
                                  height: screenWidth / 5,
                                  width: screenWidth / 5,
                                  child: Image.asset("assets/buttons/email.png")
                              ),
                            ),
                            Text("Bizə yazın",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                      fontSize: screenWidth / 28,
                                    ),
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
