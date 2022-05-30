import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/bonus_cart.dart';
import 'package:kingsmart_online_app/models/favorite_products_model.dart';
import 'package:kingsmart_online_app/models/promo_products_model.dart';
import 'package:kingsmart_online_app/screens/components/reference_slider.dart';
import 'package:kingsmart_online_app/screens/main/main_screen/favorite_products.dart';
import 'package:kingsmart_online_app/screens/main/main_screen/slide_panel/bonus_card_slider/main.dart';
import 'package:kingsmart_online_app/screens/main/main_screen/trend_categories.dart';
import 'package:kingsmart_online_app/services/favorite_products_service.dart';
import 'package:kingsmart_online_app/state_datas/main_screen/slide_panel/state_data_slide_panel.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../../Color.dart';
import '../../../services/promos_service.dart';
import '../../components/header_with_logo.dart';
import '../../components/search_input.dart';
import 'main_screen_promos.dart';

class MainScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Color kingsRed = CustomColors().kingsRed;
    bool offStage = Provider.of<StateDataSlidePanel>(context).slidePanelOffStage;
    Function toggleOffStage = Provider.of<StateDataSlidePanel>(context).toggleSlidePanelOffStage;
    BonusKart bonusKart = Provider.of<BonusKart>(context);
    return SafeArea(
      child: Container(
          color: kingsRed,
          child: SlidingUpPanel(
            parallaxEnabled: true,
            //minHeight: 90,
            maxHeight: MediaQuery.of(context).size.height,
            parallaxOffset: .5,
            backdropEnabled: true,
            onPanelClosed: () {
              toggleOffStage( true );
            },
            onPanelOpened: () {
              toggleOffStage( false );
            },
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18.0), topRight: Radius.circular(18.0)),
            color: Colors.transparent, //  Color(0xFFFFF9F3),
            panel: Container(
              decoration: BoxDecoration(
                  color: Color(0xFFFFF9F3),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(18.0),
                      topRight: Radius.circular(18.0))),
              //child: Container(),
              child: Offstage(
                offstage: offStage,
                child: AnimatedContainer(
                  duration: Duration(microseconds: 200),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 30.0, bottom: 40),
                        child: Text(
                          "Kart Məlumatları",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(fontSize: 18),
                              color: Color(0xFFEA0029)),
                        ),
                      ),
                      bonusKart.status == "notfound" ? Container() : Main(),
                      Padding(
                        padding: const EdgeInsets.only(top: 60.0, bottom: 10.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Image.asset("assets/layers/iButton.png"),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Dinamik hesab növü",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 16),
                                color: Color(0xFFFF8A23)),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 15.0, left: 30, right: 30),
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Loyallıq kartından daha çox fayda əldə etmək istəyirsiniz? Elə isə hesab növünüzü daha çox alış veriş edərək Elit hesaba yüksəldin.",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(fontSize: 13),
                                color: Color(0xFF8A8A8A)),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: MultiProvider(providers: [
              FutureProvider<FavoriteProductsModel>(create: (context) => FavoriteProductsService.getFavoriteProducts( 6 ), initialData: FavoriteProductsModel()) ,
              FutureProvider<PromoProductsModel>(create: (context) => PromosService.getPromoProducts( 6 ), initialData: PromoProductsModel()) ,
            ],
            child: Body()),
            collapsed: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 30,
                    height: 2,
                    decoration: BoxDecoration(
                        color: Color(0xFFCDCDCF),
                        borderRadius: BorderRadius.circular(15)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/buttons/wallet.png"),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Text(
                              "Sizin keşbek məbləğiniz",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(),
                                  color: Color(0xFFEA0029)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 3.0, top: 0, right: 3, bottom: 0),
                            child: bonusKart.status == "loading" ? Shimmer.fromColors(
                              baseColor: Color(0xFFf5f5f7),
                              highlightColor: Colors.black,
                              child: Text( "Yüklənir",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(fontSize: 14),
                                    color: Colors.black),
                              ),
                            ): Text( bonusKart.balans + " ₼",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(fontSize: 14),
                                  color: Colors.black),
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
        ),
    );
  }
}

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return SizedBox(
      child: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: Column(
              children: [
                HeaderWithLogo(),
                SearchInput(),
                SizedBox(height: MediaQuery.of(context).size.height / 80,),
                ReferenceSlider(),
                SizedBox(height: MediaQuery.of(context).size.height / 80,),
                FavoriteProducts(),
                TrendCategories(showAllButton: false, mainTitleColor: Colors.white, categoryTitleColor: Colors.white, mainTitleText: "Məşhur kateqoriyalar",),
                MainScreenPromos(),// promotions
                SizedBox(height: MediaQuery.of(context).size.height / 3,),
              ],
            ),
          )

        ],
      ),
    );
  }
}