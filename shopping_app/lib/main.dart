import 'package:shopping_app/screens/welcome_page.dart';

import 'package:shopping_app/screens/login.dart';
import 'package:shopping_app/screens/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}
