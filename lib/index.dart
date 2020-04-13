  
import 'package:flutter/material.dart';
import 'package:my_fatapp/rootpage.dart';
import 'package:my_fatapp/services/authentication.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'MyFatApp',
        debugShowCheckedModeBanner: false,
        theme: new ThemeData(
          primarySwatch: Colors.purple,
        ),
        home: new RootPage(auth: new Auth()));
  }
}