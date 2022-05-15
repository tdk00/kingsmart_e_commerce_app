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
        _total += (key.price - key.discount) * value;
      });
      return _total;
    }
  }

  int get totalProduct {
    return shoppingCartItems.length;
  }

  void addFirstItemToBasket(ProductModel product) {
    shoppingCartItems[product] = 1;
    notifyListeners();
  }

  void increaseProduct(ProductModel product) {
    if (shoppingCartItems[product] == null) {
      addFirstItemToBasket(product);
      return;
    } else {
      shoppingCartItems[product] = shoppingCartItems[product] !+ 1;
    }
    notifyListeners();
  }

  void decreaseProduct(ProductModel product) {
    if (shoppingCartItems[product] == null) return;
    if (shoppingCartItems[product] == 0) {
      shoppingCartItems.removeWhere((key, value) => key == product);
    } else {
      shoppingCartItems[product] = shoppingCartItems[product] !- 1;
    }
    notifyListeners();
  }

  Map<String, dynamic> toJson() =>
      {
        'items': shoppingCartItems
      };
}