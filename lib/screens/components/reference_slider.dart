import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../models/reference_slider_model.dart';

class ReferenceSlider extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<ReferenceSliderModel> slidersModelList = Provider.of<List<ReferenceSliderModel>>(context);
    List<Widget> widgetSliders = [];

    for( var i = 0; i < slidersModelList.length; i ++)
    {
      widgetSliders.add( ReferenceSliderWidget( slidersModelList[i] ) );
    }

    return  CarouselSlider(
      items: widgetSliders,
      options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          aspectRatio: 3.5,
          onPageChanged: (index, reason) {

          }),
    );
  }
}

class ReferenceSliderWidget extends StatelessWidget {

  final ReferenceSliderModel slider;
  ReferenceSliderWidget(this.slider);

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 1.13,
        height: MediaQuery.of(context).size.height / 5.23,
        child: Row(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width / 1.94,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 23.14,
                      top: MediaQuery.of(context).size.width / 43.14),
                  child: Text(
                    slider.title,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width /
                              37.43,
                          fontWeight: FontWeight.w500,
                        ),
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.94,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 23.14,
                      top:
                      MediaQuery.of(context).size.height / 83.14),
                  child: Text(
                    slider.summary,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize:
                          MediaQuery.of(context).size.width /
                              35.43,
                        ),
                        color: Colors.black),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 1.94,
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 23.14,
                      top:
                      MediaQuery.of(context).size.height / 83.14),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () async {
                           var url = Uri.parse(slider.link);
                          if (await canLaunchUrl(url)) {
                            await launchUrl(url);
                          } else {
                            throw 'Could not launch $url';
                          }
                        },
                        child: Text(
                          "Daha ətraflı",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: MediaQuery.of(context)
                                      .size
                                      .width /
                                      35.43,
                                  fontWeight: FontWeight.w500),
                              color: Color(0xFFEA0029)),
                        ),
                      ),
                      Icon(
                        Icons.play_arrow,
                        color: Colors.red,
                        size: 23,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
                width: MediaQuery.of(context).size.width / 11.125),
            SizedBox(
              height: MediaQuery.of(context).size.width / 3.125,
              child: Tab(
                icon: Image(
                  image: NetworkImage(
                    slider.icon,
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

