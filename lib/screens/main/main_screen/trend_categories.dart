import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../../services/config.dart';

class TrendCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = Provider.of<List<CategoryModel>>(context);
    if( categoryList.isEmpty ){
      return Expanded(flex: 0, child: Container());
    }
    return Expanded(
      flex: 141,
      child: Container(
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width / 17.4,
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 40,
                    bottom: MediaQuery.of(context).size.height / 40),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Məşhur Kateqoriyalar",
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: MediaQuery.of(context).size.width / 20.43,
                        ),
                        color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height:  MediaQuery.of(context).size.height * .14,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categoryList.length ,
                    itemBuilder: (context, i) {
                      return TrendCategoryCard(categoryModel: categoryList[i]);
                    }),

              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TrendCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const TrendCategoryCard({required this.categoryModel});
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
      },
      child: Column(
        children: [
          Expanded(
            child: AspectRatio(
              aspectRatio: 1,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: Image(
                  image: NetworkImage(
                    Config().apiBaseUrl.toString() + categoryModel.image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width / 5.3,
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
              child: Text(
                  categoryModel.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width / 26.43,
                    ),
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}