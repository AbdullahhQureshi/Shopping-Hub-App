import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/widget/app_drawer.dart';
import 'package:shopping_app/widget/badge.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/widget/product_list.dart';

import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class Allproduct extends StatefulWidget {
  static const routeName = '/allproduct';
  @override
  _AllproductState createState() => _AllproductState();
}

class _AllproductState extends State<Allproduct> {
  var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Products'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
              builder: (_, cart, ch) => Badge(
                child: ch,
                value: cart.itemCount.toString(),
              ),
              child: IconButton(
                icon: Icon(
                  Icons.shopping_cart,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
          ],
        ),
        drawer: AppDrawer(),
        body: Productlist());
  }
}
