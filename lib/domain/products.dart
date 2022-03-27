import 'package:flutter/material.dart';
import 'package:flutter_amazone/domain/product.dart';

class Products with ChangeNotifier {

  bool showFavs = false;

  List<Product> _productList = [
    Product(
      name: 'Mouse',
      desc: 'Rgb Mouse',
      price: 12.40,
      url:
          'https://thermaltake.azureedge.net/pub/media/catalog/product/cache/6bf0ed99c663954fafc930039201ed07/l/2/l20m04.jpg',
    ),
    Product(
      name: 'MousePad',
      desc: 'Silicon mouse pad',
      price: 20.13,
      url:
          'https://cdn.shopify.com/s/files/1/0003/2279/7628/products/personalized-computer-mouse-pad-rawhide.jpg?v=1571709432',
    ),
    Product(
      name: 'Desk',
      desc: 'Work Desk',
      price: 50.40,
      url:
          'https://static.fully.com/image/upload/c_limit,dpr_2.0,f_auto,h_700,q_auto,w_700/v1/media/catalog/product/f/u/fully-jarvis-standing-desk-black-bamboo-contour-c-v1.jpg',
    ),
    Product(
      name: 'Chair',
      desc: 'Gaming chair',
      price: 40.40,
      url: 'https://m.media-amazon.com/images/I/61rDiUQYxWL._AC_SX425_.jpg',
    ),
  ];

  List<Product> getItems() {
    return _productList;
  }
  
  List<Product> getFavorit(){
    return _productList.where((element) => element.fav).toList();
  }

  void addProduct(value) {
    _productList.add(value);
    notifyListeners();
  }

  void changeFav(Product product) {
    product.changeFav();
    notifyListeners();
  }
}
