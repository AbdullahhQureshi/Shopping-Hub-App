import 'package:shopping_app/provider/products.dart';
import 'package:shopping_app/provider/cart.dart';
import 'package:shopping_app/screens/allproduct_screen.dart';
import 'package:shopping_app/screens/order_screen.dart';
import 'package:shopping_app/screens/productdetail_screen.dart';
import 'package:shopping_app/screens/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:shopping_app/provider/order.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Products(),
          ),
          ChangeNotifierProvider.value(
            value: Cart(),
          ),
          ChangeNotifierProvider(
            create: (context) => Orders(),
          )
        ],
        child: MaterialApp(home: WelcomeScreen(), routes: {
          Productdetail.routName: (ctx) => Productdetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
          OrdersScreen.routeName: (ctx) => OrdersScreen(),
          Allproduct.routeName: (ctx) => Allproduct(),
        }));
  }
}
