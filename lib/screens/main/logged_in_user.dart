import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/models/promo_products_model.dart';
import 'package:kingsmart_online_app/screens/main/snake_navigation.dart';
import 'package:kingsmart_online_app/services/promos_service.dart';
import 'package:provider/provider.dart';

import '../../../../../models/bonus_cart.dart';
import '../../models/category_model.dart';
import '../../models/favorite_products_model.dart';
import '../../models/reference_slider_model.dart';
import '../../models/shopping_cart_model.dart';
import '../../services/bonus_card_service.dart';
import '../../services/category_service.dart';
import '../../services/favorite_products_service.dart';
import '../../services/reference_slider_service.dart';
import '../../services/shopping_cart_service.dart';
import '../../state_datas/main_screen/slide_panel/state_data_slide_panel.dart';

class LoggedInUser extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<StateDataSlidePanel>(
          create: (BuildContext context) => StateDataSlidePanel(),
        ),
        FutureProvider<BonusKart>(create: (context) => BonusCardService.getDetails(), initialData: BonusKart("0","0","0", "loading") ),
        FutureProvider<List<ReferenceSliderModel>>(create: (context) => ReferenceSliderService.getDetails(), initialData: const [] ),
        FutureProvider<ShoppingCartModel>(create: (context) => ShoppingCartService.getShoppingCart(), initialData: ShoppingCartModel(), ),
        FutureProvider<List<CategoryModel>>(create: (context) => CategoryService.getTrendCategories(), initialData: const []  ) ,
      ],
      child: SnakeNavigation(),
    );
  }
}