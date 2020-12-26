import 'package:flutter/material.dart';
import 'file:///E:/projects/shopping_app/lib/provider/product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
        id: '1',
        title: 'Yellow Scarf',
        discription: 'this is an imported product',
        imageurl:
            'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
        price: 29.12),
    Product(
        id: '2',
        title: 'A Pan',
        discription: 'Prepare any meal you want.',
        imageurl:
            'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
        price: 49.99),
    Product(
        id: '3',
        title: 'red shirt',
        discription: 'this is an imported product',
        imageurl:
            'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
        price: 12.5)
  ];
  List<Product> get items {
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isfavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  void addproduct() {
    // _items.add(value);
    notifyListeners();
  }
}
