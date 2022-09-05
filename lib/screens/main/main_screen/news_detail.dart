import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Color.dart';
import '../../../models/news_model.dart';
import '../../../helpers/config.dart';
import '../../../services/news_service.dart';


class NewsDetailFP extends StatefulWidget {
  final int newsId;
  const NewsDetailFP({Key? key,  required this.newsId }) : super(key: key);

  @override
  State<NewsDetailFP> createState() => _NewsDetailFPState();
}

class _NewsDetailFPState extends State<NewsDetailFP> {
  @override
  Widget build(BuildContext context) {
    return FutureProvider<List<NewsModel>>.value(

      value: NewsService.getAllNews(),
      initialData: [],
      child: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {

    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;

    List<NewsModel> news = Provider.of<List<NewsModel>>(context);
    List<String> _imgProductSlider = [];
    for( var i = 0; i < news.length; i++) {
        _imgProductSlider.add(Config().apiBaseUrl + news[i].image);
    }
    return SafeArea(child: Scaffold(
        body: news.isNotEmpty ?
        Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only( left: screenWidth / 25, top: height1 / 80, bottom: height1 / 80),
                color: CustomColors().kingsRed,
                child: SizedBox(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.zero,
                                  minimumSize: Size(0, 0),
                                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  alignment: Alignment.centerLeft),
                              child: Container(
                                alignment: Alignment.center,
                                child: Icon( Icons.arrow_back_ios, color: Colors.white, size: screenWidth / 20.43 ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 10,
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("Kampaniyalar",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: screenWidth / 20.43,
                                  ),
                                  color: Colors.white),),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(""),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(flex: 10,child: SizedBox(
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth / 30.43, left: screenWidth / 30.43),
                child: CarouselSlider(
                  items: _imgProductSlider
                      .map((item) => Container(
                    child: Center(
                        child:
                        Image.network(item, fit: BoxFit.fitHeight, width: 400)),
                  ))
                      .toList(),
                  options: CarouselOptions(
                      aspectRatio: 0.6,
                      viewportFraction: 1.0,
                      autoPlay: false,
                      enlargeCenterPage: true
                  ),
                ),
              ),
            )),


          ],
        )
            :
        shimmer(screenWidth, height1)
    ));
  }

  Widget shimmer(screenWidth, height1 ){
    return Shimmer.fromColors(
      baseColor: Color(0xFFf5f5f7),
      highlightColor: Color(0xFFEBEBF4),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 8 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 70),
            width: screenWidth / 1.1 ,
            height: height1 / 3 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 50 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 50 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 50 ,
            color: Color(0xFFEBEBF4),
          ),
          Container(
            margin: EdgeInsets.only(left: screenWidth / 25, top: height1 / 30),
            width: screenWidth / 1.1 ,
            height: height1 / 50 ,
            color: Color(0xFFEBEBF4),
          ),
        ],
      ),
    );
  }
}
