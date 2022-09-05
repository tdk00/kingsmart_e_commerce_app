import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/screens/main/main_screen/news_detail.dart';
import 'package:kingsmart_online_app/helpers/config.dart';
import 'package:provider/provider.dart';
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

    return CarouselSlider(
      items: widgetSliders,
      options: CarouselOptions(
          viewportFraction: 1,
          autoPlay: false,
          enableInfiniteScroll: false,
          enlargeCenterPage: true,
          aspectRatio: 4.5,
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

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;

    return  GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailFP(newsId: slider.newsId )));

      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: SizedBox(
          width: screenWidth / 1.13,
          child: Row(
            children: [
              Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: screenWidth / 1.94,
                      padding: EdgeInsets.only(
                          left: screenWidth / 23.14,
                          top: screenWidth / 43.14),
                      child: Text(
                        slider.title,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize: screenWidth / 37.43,
                              fontWeight: FontWeight.w500,
                            ),
                            color: Colors.black),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      width: screenWidth / 1.94,
                      padding: EdgeInsets.only(
                          left: screenWidth / 23.14,
                          top: screenWidth / 183.14),
                      child: Text(
                        slider.summary,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                              fontSize:screenWidth / 35.43,
                            ),
                            color: Colors.black),
                      ),
                    ),
                  ),
                  // slider.hasLink
                  //   ?
                  // Container(
                  //   width: screenWidth / 1.94,
                  //   padding: EdgeInsets.only( left: screenWidth / 23.14,),
                  //   child: Row(
                  //     children: [
                  //       TextButton(
                  //         style: TextButton.styleFrom(
                  //             padding: EdgeInsets.zero,
                  //             minimumSize: Size(0, 0),
                  //             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  //             alignment: Alignment.centerLeft),
                  //         onPressed: () async {
                  //             Navigator.push(context, MaterialPageRoute(builder: (_) => NewsDetailFP(newsId: slider.newsId )));
                  //         },
                  //         child: Text(
                  //           "Daha ətraflı",
                  //           style: GoogleFonts.montserrat(
                  //               textStyle: TextStyle(
                  //                   fontSize: screenWidth / 35.43,
                  //                   fontWeight: FontWeight.w500),
                  //               color: Color(0xFFEA0029)),
                  //         ),
                  //       ),
                  //       Icon(
                  //         Icons.play_arrow,
                  //         color: Colors.red,
                  //         size: 23,
                  //       ),
                  //     ],
                  //   ),
                  // )
                  //     :
                  //     SizedBox()
                ],
              ),
              SizedBox( width: screenWidth / 9.125),
              SizedBox(
                height: height1 / 12.125,
                child: Tab(
                  icon: Image(
                    fit: BoxFit.fitHeight,
                    image: NetworkImage(
                      Config().apiBaseUrl + slider.icon,
                    ),
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