import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/models/category_model.dart';
import 'package:provider/provider.dart';

import '../../../services/config.dart';
import '../../store/all_categories.dart';
import '../../store/category_products.dart';

class TrendCategories extends StatelessWidget {
  final bool showAllButton;
  final Color mainTitleColor;
  final Color categoryTitleColor;
  final String mainTitleText;
  TrendCategories({required this.showAllButton, required this.mainTitleColor, required this.categoryTitleColor, required this.mainTitleText });
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categoryList = Provider.of<List<CategoryModel>>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).viewPadding;
    double height1 = height - padding.top - kToolbarHeight;
    if( categoryList.isEmpty ){
      return Expanded(flex: 0, child: Container());
    }
    return Container(
      height: height1 / 4.2,
      padding: EdgeInsets.only(
        left: screenWidth / 17.4,
        top: height1 / 64.2,
      ),
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  flex: 4,
                  child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                  mainTitleText,
                    textAlign: TextAlign.left,
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: screenWidth / 26.43,
                        ),
                        color: categoryTitleColor),
                  ),
              ),
                ),
                showAllButton ?  Expanded(
                  flex: 4,
                  child: TextButton(
                        style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            minimumSize: Size(0, 0),
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            alignment: Alignment.centerLeft),
                    onPressed: (){
                      Navigator.push(context,  MaterialPageRoute(builder: (_) => AllCategories()));
                    },
                    child: Container(
                      padding: EdgeInsets.only(right: screenWidth / 56.43),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Bütün Kateqoriyalar",
                          textAlign: TextAlign.right,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                fontSize: screenWidth / 26.43,
                              ),
                              color: CustomColors().kingsRed),
                        ),
                      ),
                    ),
                  ),
                ):
                    Expanded(flex: 0, child: SizedBox())
            ]
            ),
          ),
          Expanded(
            flex: 4,
            child: SizedBox(
              width: screenWidth,
              height:  height1 * .14,
              child: ListView.separated(
                shrinkWrap: true,
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                        width: screenWidth / 50,
                      ),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryList.length ,
                  itemBuilder: (context, i) {
                    return TrendCategoryCard(categoryModel: categoryList[i], titleColor: categoryTitleColor);
                  }),

            ),
          ),
        ],
      ),
    );
  }
}

class TrendCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  final Color titleColor;
  const TrendCategoryCard({required this.categoryModel, required this.titleColor});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(context,  MaterialPageRoute(builder: (_) => CategoryProducts(id: categoryModel.id, categoryName: categoryModel.title)));
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
              width: screenWidth / 5.3,
              margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
              child: Text(
                  categoryModel.title,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                      fontSize: screenWidth / 26.43,
                    ),
                    color: titleColor),
              ),
            ),
          ),
        ],
      ),
    );
  }
}