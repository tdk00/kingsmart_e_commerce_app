import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

import '../../../Color.dart';
import '../../../models/news_model.dart';
import '../../../helpers/config.dart';
import '../../../services/news_service.dart';


class NewsDetailFP extends StatelessWidget {
  final int newsId;
  const NewsDetailFP({Key? key,  required this.newsId }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FutureProvider<NewsModel>.value(
      value: NewsService.getNewsById( newsId ),
      initialData: NewsModel(id: 0, title: '', image: '', content: '', createdAt: ''),
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

    NewsModel news = Provider.of<NewsModel>(context);

    return SafeArea(child: Scaffold(
        body: news.id > 0 ?
        Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.only( left: screenWidth / 25, top: height1 / 80, bottom: height1 / 80),
                color: CustomColors().kingsRed,
                child: SizedBox(
                  child: Column(
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
                                alignment: Alignment.topLeft,
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
                            child: Text(news.title,
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
                            child: Text(news.createdAt,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    fontSize: screenWidth / 30.43,
                                  ),
                                  color: Colors.white),),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
            Expanded(flex: 4,child: SizedBox(
              child: Image(
                fit: BoxFit.fitHeight,
                image: NetworkImage(
                  Config().apiBaseUrl.toString() + news.image,
                ),
              ),
            )),
            Expanded(flex: 7,child:
            Padding(
              padding: EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Html(data: news.content, style: {
                    'body' : Style(
                      fontSize: FontSize.em(1.4)
                    ),
                  },),
                ),
              ),
            ))


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
