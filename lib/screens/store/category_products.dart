import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/models/product_model.dart';
import 'package:kingsmart_online_app/screens/components/header_with_back.dart';
import 'package:kingsmart_online_app/screens/components/header_with_only_title.dart';
import 'package:kingsmart_online_app/screens/components/products_grid_view.dart';
import 'package:kingsmart_online_app/screens/components/search_input.dart';
import 'package:kingsmart_online_app/screens/components/sort_bar.dart';
import 'package:kingsmart_online_app/services/category_service.dart';
import 'package:kingsmart_online_app/state_datas/store/state_data_sorting.dart';
import 'package:provider/provider.dart';

import '../../models/favorite_products_model.dart';
import '../../models/promo_products_model.dart';
import '../../models/radio_model.dart';
import '../../services/favorite_products_service.dart';
import '../../services/promos_service.dart';
import '../components/radio_item.dart';

class CategoryProducts extends StatelessWidget {
  final int id;
  final String categoryName;
  final String? searchKeyWord;
  const CategoryProducts({ required this.id , required this.categoryName, this.searchKeyWord, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String sortByString = Provider.of<StateDataSorting>(context).sortByString;
    return MultiProvider(
        providers: [
          FutureProvider<FavoriteProductsModel>(create: (context) => FavoriteProductsService.getFavoriteProducts( 6 ), initialData: FavoriteProductsModel()) ,
          FutureProvider<PromoProductsModel>(create: (context) => PromosService.getPromoProducts( 6 ), initialData: PromoProductsModel()) ,
          searchKeyWord == null ?
          FutureProvider<List<ProductModel>>.value(
            value: CategoryService.fetchProductsByCategoryId( id, sortByString ), initialData: [],)
          :
          FutureProvider<List<ProductModel>>.value(
            value: CategoryService.fetchProductsBySearch( searchKeyWord, sortByString ), initialData: [],)
          ,
        ],
        child: Body(categoryName: categoryName,)
    );
  }
}

class Body extends StatelessWidget {
  final String categoryName;
  const Body({required this.categoryName});
  @override
  Widget build(BuildContext context) {
    List<ProductModel> productList = Provider.of<List<ProductModel>>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Container(
            color: Color(0xFFFFF9F3),
            child: Column(
              children: [
                Container( color: CustomColors().kingsRed , child: HeaderWithBack(title: categoryName), ),
                Container( color: CustomColors().kingsRed , child: SearchInput(), ),
                Container( color: CustomColors().kingsRed,height: MediaQuery.of(context).size.height / 50,),
                Container( color: Color(0xFFFFF9F3) ,height: MediaQuery.of(context).size.height / 15, child: SortBar(context: context, productsCount : productList.length),),
                Container( color: Color(0xFFFFF9F3) ,height: MediaQuery.of(context).size.height / 50,),
                Expanded(child: ProductGridView(productList: productList,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

