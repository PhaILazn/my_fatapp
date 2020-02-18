import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_sign_in/google_sign_in.dart';

void main() => runApp(MaterialApp(
      theme:
          ThemeData(primaryColor: Colors.red, accentColor: Colors.blueAccent),
      debugShowCheckedModeBanner: false,
      title: "I'm Fat",
      home: SplashScreen(),
    ));

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 3), () => Navigator.of(context).push(_createRoute()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      fit: StackFit.expand,
      children: <Widget>[
        Container(
            decoration: BoxDecoration(
          color: Colors.white,
        )),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                    CircleAvatar(
                      backgroundColor: Colors.lightBlueAccent,
                      radius: 50.0,
                      child: Image.network("https://thumbs.gfycat.com/JovialDenseDunlin-size_restricted.gif")
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                    ),
                    Text(
                      "MyFatApp",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ])),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(
                    valueColor: new AlwaysStoppedAnimation<Color>(Colors.blue),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 50.0),
                  ),
                  Text(
                      "  Application Unpacking... \nAll rights limited to Fat Co.",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold))
                ],
              ),
            ),
          ],
        )
      ],
    ));
  }
}

Route _createRoute() {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => LoginPage(),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset(0.0, .75);
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

class Page2 extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text('Page 2'),
      ),
    );
  }
}

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

  _login() async{
    try{
      await _googleSignIn.signIn();
      setState(() {
        _isLoggedIn = true;
      });
    } catch (err){
      print(err);
    }
  }

  _logout(){
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
        body: Center(
            child: _isLoggedIn
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.network(_googleSignIn.currentUser.photoUrl, height: 50.0, width: 50.0,),
                      Text(_googleSignIn.currentUser.displayName),
                      Text(_googleSignIn.currentUser.email),
                      OutlineButton( child: Text("Logout"), onPressed: (){
                        _logout();
                      },)
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
