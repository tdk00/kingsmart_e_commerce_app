import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/models/product_model.dart';

class PromoProductsModel extends ChangeNotifier{

  List<ProductModel> promoProducts = [];

  void add( ProductModel product ){
    promoProducts.add( product );
  }

  get getPromoProducts {
    return promoProducts;
  }

  void toggleIsFavorite(bool status, ProductModel productModel){
    for(var i = 0; i < promoProducts.length; i++){
      if( promoProducts[i].id == productModel.id ){
        promoProducts[i].toggleIsFavorite( status );
      }
    }
  }

}