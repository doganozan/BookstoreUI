import 'package:flutter/material.dart';
import 'package:bookstoreappui/screens/home_screen.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BookStore App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Colors.purpleAccent),
      home: HomeScreen(),
    );
  }
}

