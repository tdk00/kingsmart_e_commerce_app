import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../models/bonus_cart.dart';
import 'back_face.dart';
import 'front_face.dart';

class Main extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    BonusKart bonusKart = Provider.of<BonusKart>(context);
    List<Widget> widgetSliders = [];
    if( bonusKart.cardCode != "0" )
      {
        widgetSliders.add(FrontFace());
        widgetSliders.add(BackFace());
      }
    return  CarouselSlider(
              items: widgetSliders,
              options: CarouselOptions(
                  viewportFraction: 0.9,
                  autoPlay: false,
                  enableInfiniteScroll: false,
                  enlargeCenterPage: true,
                  aspectRatio: 2,
                  onPageChanged: (index, reason) {

                  }),
            );
  }
}