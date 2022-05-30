import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/Color.dart';
import 'package:kingsmart_online_app/screens/components/header_with_only_title.dart';
import 'package:kingsmart_online_app/screens/components/products_grid_view.dart';
import 'package:kingsmart_online_app/screens/components/search_input.dart';
import 'package:provider/provider.dart';

import '../../models/favorite_products_model.dart';
import '../../models/promo_products_model.dart';
import '../../services/favorite_products_service.dart';
import '../../services/promos_service.dart';
import '../main/main_screen/trend_categories.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        FutureProvider<FavoriteProductsModel>(create: (context) => FavoriteProductsService.getFavoriteProducts( 6 ), initialData: FavoriteProductsModel()) ,
        FutureProvider<PromoProductsModel>(create: (context) => PromosService.getPromoProducts( 10 ), initialData: PromoProductsModel()) ,
      ],
      child: Body()
    );
  }
}

class Body extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    PromoProductsModel model = Provider.of<PromoProductsModel>(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          child: Container(
            color: Color(0xFFFFF9F3),
            child: Column(
              children: [
                Container( color: CustomColors().kingsRed , child: HeaderWithOnlyTitle(title: "Onlayn Market"), ),
                Container( color: CustomColors().kingsRed , child: SearchInput(), ),
                Container( color: CustomColors().kingsRed,height: MediaQuery.of(context).size.height / 50,),
                TrendCategories(showAllButton: true, mainTitleColor: Colors.black, categoryTitleColor: Colors.black, mainTitleText: "Kateqoriyadan seç", ),
                Expanded(child: ProductGridView(title: "Endirimli məhsullar", productList: model.promoProducts,)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}