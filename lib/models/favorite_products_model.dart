import 'package:flutter/material.dart';
import 'package:kingsmart_online_app/models/product_model.dart';

  class FavoriteProductsModel extends ChangeNotifier{

  List<ProductModel> favoriteProducts = [];

  void add( ProductModel product ){
    favoriteProducts.add( product );
  }

   get getFavoriteProducts {
    return favoriteProducts;
  }

  void toggleIsFavorite(bool status, ProductModel productModel){
      for(var i = 0; i < favoriteProducts.length; i++){
        if( favoriteProducts[i].id == productModel.id ){
          favoriteProducts[i].toggleIsFavorite( status );
        }
      }
  }

}