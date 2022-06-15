import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/account/address.dart';
import 'package:kingsmart_online_app/screens/account/contact_us.dart';
import 'package:kingsmart_online_app/screens/account/order_history_list.dart';
import 'package:kingsmart_online_app/screens/account/profile.dart';
import 'package:kingsmart_online_app/screens/components/header_with_only_title.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Color.dart';
import '../login/start.dart';
import '../store/category_products.dart';
import 'Terms.dart';

class AccountMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Body();
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container( height: height1 / 12,color: CustomColors().kingsRed , child: HeaderWithOnlyTitle(title: "Onlayn Market"), ),
            SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AccountMenuHeader(title: "Mənim hesabım",),
                AccountMenuItem(title: 'Profilim', route: ProfileFuture() ),
                AccountMenuItem(title: 'Ünvanlarım', route: AddressFuture()),
                AccountMenuItem(title: 'Sifarişlər', route: OrderHistoryListCNP()),
                AccountMenuHeader(title: "Alətlər",),
                AccountMenuItem(title: 'Promolar', route: CategoryProducts(id: -2, categoryName: "Promolar"),),
                // AccountMenuItem(title: 'Bildirişlər', route: Start()),
                AccountMenuHeader(title: "Kömək",),
                AccountMenuItem(title: 'Qaydalar', route: TermsFP()),
                AccountMenuItem(title: 'Bizimlə əlaqə', route: ContactUsFP()),
                AccountMenuItem(title: 'Çıxış', route: Start(), isExit: true),
              ],
            ),
          ),
        ]
        ),
      ),
    );
  }
}

class AccountMenuItem extends StatelessWidget{
  final String title;
  final Widget route;
  final bool? isExit;
  AccountMenuItem({ required this.title, required this.route, this.isExit });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Container(
      padding: EdgeInsets.only(left: screenWidth / 20, right: screenWidth / 20),
      child: InkWell(
        splashColor: Colors.redAccent,
        onTap: () async {
          if( isExit == true )
            {
              var prefManager = await SharedPreferences.getInstance();
              await prefManager.clear();
              SystemNavigator.pop();
            }
          else
            {
              Navigator.push(context,  MaterialPageRoute(builder: (_) => route));
            }
        },
        child: SizedBox(
          height: height1 / 20,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title,
                  textAlign: TextAlign.left,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        // fontWeight: FontWeight.bold,
                        fontSize: screenWidth / 28,
                      ),
                      color: Colors.black)),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.grey,
                  size: screenWidth / 25,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AccountMenuHeader extends StatelessWidget{
  final String title;
  AccountMenuHeader({ required this.title });
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    return Container(
      padding: EdgeInsets.only(left: screenWidth / 20, top: height1 / 60),
      child: Text(title,
          textAlign: TextAlign.left,
          style: GoogleFonts.montserrat(
              textStyle: TextStyle(
                // fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width / 25,
              ),
              color: Colors.grey)),
    );
  }

}
