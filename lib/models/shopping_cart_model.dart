import 'package:flutter/cupertino.dart';
import 'package:kingsmart_online_app/models/product_model.dart';

class ShoppingCartModel with ChangeNotifier {
  Map<ProductModel, int> shoppingCartItems = {};

  double get basketTotalMoney {
    if (shoppingCartItems.isEmpty) {
      return 0;
    } else {
      double _total = 0;
      shoppingCartItems.forEach((key, value) {
        _total += (key.price) * value;
      });
      return _total;
    }
  }

  int get totalProduct {
    return shoppingCartItems.length;
  }

  void addFirstItemToCart(ProductModel product, count) {
    shoppingCartItems[product] = count;
    notifyListeners();
  }

  void addToCartWithQuantity(ProductModel product, int count) {
    bool productIsInCart = false;
    shoppingCartItems.forEach( ( productModel, productCount ) {
      if( productModel.id == product.id )
      {
        shoppingCartItems[productModel] = shoppingCartItems[productModel] !+ productCount;
        productIsInCart = true;
      }
    } );

    if( ! productIsInCart ) {
      addFirstItemToCart(product, count);
      return;
    }
    notifyListeners();
  }

  void increaseProduct(ProductModel product) {
    bool productIsInCart = false;
    shoppingCartItems.forEach( ( productModel, productCount ) {
      if( productModel.id == product.id )
        {
          shoppingCartItems[productModel] = shoppingCartItems[productModel] !+ 1;
          productIsInCart = true;
        }
    } );

    if( ! productIsInCart ) {
      addFirstItemToCart(product, 1);
      return;
    }
    notifyListeners();
  }

  void decreaseProduct(ProductModel product) {
    var shouldRemove;
    shoppingCartItems.forEach( ( productModel, productCount ) {
      if( productModel.id == product.id )
      {
        if (shoppingCartItems[productModel] == null) return;

        if (shoppingCartItems[productModel] == 1) {
          shouldRemove = productModel;
        } else {
          shoppingCartItems[productModel] = shoppingCartItems[productModel] !- 1;
        }
      }
    } );

    if( shouldRemove != null )
      {
        shoppingCartItems.removeWhere((key, value) => key == shouldRemove);
      }

    notifyListeners();
  }

  Map<String, dynamic> toJson() =>
      {
        'items': shoppingCartItems
      };
}