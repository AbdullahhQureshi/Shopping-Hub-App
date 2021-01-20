import 'package:flutter/foundation.dart';

class SearchedItem {
  final String id;
  final String title;
  final String discription;
  final double price;
  final String imageurl;

  SearchedItem({
    @required this.id,
    @required this.title,
    @required this.discription,
    @required this.price,
    @required this.imageurl,
  });
}

class Searched with ChangeNotifier {
  Map<String, SearchedItem> _items = {};

  Map<String, SearchedItem> get items {
    return {..._items};
  }

 /* void addSearchedItem(
      String productId,
      double price,
      String title,
      String imageurl,
      ) {
    if (_items.containsKey(productId)) {
      // change quantity...
      _items.update(
        productId,
            (existingCartItem) => SearchedItem(
          id: existingCartItem.id,
          title: existingCartItem.title,
          price: existingCartItem.price,
         // quantity: existingCartItem.quantity + 1,
          imageurl: existingCartItem.imageurl,
        ),
      );
    } else {
      _items.putIfAbsent(
        productId,
            () => SearchedItem(
          id: DateTime.now().toString(),
          title: title,
          price: price,
         // quantity: 1,
        ),
      );
    }
    notifyListeners();
  }*/




}
