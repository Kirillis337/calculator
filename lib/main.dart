import 'package:flutter/material.dart';
import 'package:calculator/home.dart';
// ignore_for_file: prefer_const_constructors

void main() =>  runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(primaryColor: Color(0xFF52C9DC)),
      home:   Home(),
    );
  }

}
