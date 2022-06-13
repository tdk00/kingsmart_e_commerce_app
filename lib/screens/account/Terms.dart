import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/terms_model.dart';
import 'package:kingsmart_online_app/services/account/contact_us_service.dart';
import 'package:kingsmart_online_app/services/account/terms_service.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../Color.dart';
import '../../models/contact_us_model.dart';
import '../components/header_with_back.dart';


class TermsFP extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return FutureProvider<TermsModel>.value(
      value: TermsService.getTerms(),
      initialData: TermsModel(""),
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

    TermsModel terms = Provider.of<TermsModel>(context);


    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFF9F3),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container( height: height1 / 10, color: CustomColors().kingsRed , child: HeaderWithBack(title: 'Qaydalar'), ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Html(
                    data: terms.content,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
