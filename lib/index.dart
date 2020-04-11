import 'package:flutter/material.dart';
import 'package:my_fatapp/homePage.dart';

import 'homePage.dart';
import 'loginPage.dart';
import 'signuppage.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      home: LoginPage(),
      routes: <String, WidgetBuilder>{
        '/landingPage': (BuildContext context) => new MyApp(), //routes to the login page if user hasn't sign in
        '/signUp': (BuildContext context) => new SignupPage(), //routes to the signup page if user wants to make a new account
        '/homePage': (BuildContext context) => new HomePage() //routes to the homepage of MYFATAPP after use logins
      },
    );
  }
}