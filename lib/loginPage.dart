import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<LoginPage> {
  bool _isLoggedIn = false;

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  _login() async {
    try {
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err) {
      print(err);
    }
  }

  _logout() {
    _googleSignIn.signOut();
    setState(() {
      _isLoggedIn = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: null,
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {},
              ),
              ListTile(
                  title: Text('Am I Fat?'),
                  onTap: () {}),
              ListTile(
                title: Text('Recommeded Meal Plans'),
                onTap:(){},
              ),
              ListTile(
                title: Text('Set Reminder'),
                onTap: (){},
              ),
            ],
          ),
        ),
        body: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(
                        _googleSignIn.currentUser.photoUrl,
                        height: 100.0,
                        width: 100.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      Text(
                        _googleSignIn.currentUser.displayName,
                        style: TextStyle(
                          fontSize: 50,
                        ),
                      ),
                      Text(
                        _googleSignIn.currentUser.email,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 15),
                      ),
                      OutlineButton(
                        child: Text("Logout"),
                        onPressed: () {
                          _logout();
                        },
                      )
                    ],
                  )
                : Center(
                    child: OutlineButton(
                      child: Text("Login with Google"),
                      onPressed: () {
                        _login();
                      },
                    ),
                  )),
      ),
    );
  }
}
