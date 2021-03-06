import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_fatapp/fatBMI.dart';
import 'package:my_fatapp/mealRec.dart';
import 'package:my_fatapp/services/authentication.dart';
import 'services/authentication.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          title: Text("MyFat App"),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
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
                  color: Colors.purple,
                ),
              ),
              ListTile(
                title: Text('Home'),
                onTap: () {
                }
              ),
              ListTile(
                  title: Text('Am I Fat?'),
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => BMICalc()));
                  }),
              ListTile(
                title: Text('Recommeded Meal Plans'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => MealRecommendations()));
                },
              ),
            ],
          ),
        ),
        body: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.pink, Colors.purple]),
            ),
            child: 
            Column(children: <Widget>[
              SizedBox(
                height: 500,
                width: 500,
                child: Image.asset('assets/icon.jpg')
              ),
              AutoSizeText("This app is designed for people who do not work out on a daily basis", maxLines: 1,textAlign: TextAlign.center,)
            ],)
            
          ) 
        )
      );
  }
}
