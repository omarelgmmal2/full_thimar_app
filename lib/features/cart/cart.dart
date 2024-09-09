import 'package:flutter/material.dart';
import '../products/model.dart';

class Cart extends ChangeNotifier{
  List<ProductModel> cartProducts = [];
  double _totalPrice = 0.0;

  void addToCart(ProductModel product){
    cartProducts.add(product);
    _totalPrice += product.price;
    notifyListeners();
  }

  void removeFromCart(ProductModel product){
    cartProducts.remove(product);
    _totalPrice -= product.price;
    notifyListeners();
  }

  int get count{
    return cartProducts.length;
  }

  double get totalPrice{
    return _totalPrice;
  }

  List<ProductModel> get cartItems {
    return cartProducts;
  }
}