import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/components/search_input.dart';
import 'package:kingsmart_online_app/screens/store/category_products.dart';
import 'package:provider/provider.dart';
import '../../models/category_model.dart';
import '../../services/category_service.dart';
import '../../services/config.dart';

class AllCategories extends StatelessWidget {
  const AllCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          FutureProvider<List<CategoryModel>>(create: (context) => CategoryService.getMainCategories(), initialData: [])
        ],
        child: Body()
    );
  }
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    List<CategoryModel> categories = Provider.of<List<CategoryModel>>(context);
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Container(
            color: Color(0xFFFFF9F3),
            child: Column(
              children: [
                Container( color: CustomColors().kingsRed , child: HeaderWithBack(title: "Kateqoriyalar"), ),
                Container( color: CustomColors().kingsRed , child: SearchInput(), ),
                Container( color: CustomColors().kingsRed,height: MediaQuery.of(context).size.height / 50,),
                Expanded(
                  child: Stack(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: screenWidth / 18.43, top: MediaQuery.of(context).size.height / 30, right: screenWidth / 18.43,),
                        child: GridView.builder(
                          itemCount: categories.length,
                          gridDelegate:
                          SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                            crossAxisCount: 3,
                            childAspectRatio: 0.9),
                          itemBuilder: (context, i) {
                            return MainCategoryCard( categoryModel: categories[i] );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainCategoryCard extends StatelessWidget {
  final CategoryModel categoryModel;
  const MainCategoryCard({required this.categoryModel});
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Navigator.push(context,  MaterialPageRoute(builder: (_) => CategoryProducts(id: categoryModel.id, categoryName: categoryModel.title)));
      },
      child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: AspectRatio(
                aspectRatio: 1,
                  child: Image(
                    image: NetworkImage(
                      Config().apiBaseUrl.toString() + categoryModel.image.toString(),
                    ),
                  ),

              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 90),
                child: Text(
                  categoryModel.title,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: screenWidth / 26.43,
                      ),
                      color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}