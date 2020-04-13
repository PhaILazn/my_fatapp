import 'package:flutter/material.dart';
import 'package:my_fatapp/services/authentication.dart';


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
        home: Scaffold(
            appBar: AppBar(title: Text("Testing"),
            actions: <Widget>[
              new FlatButton(
                  child: new Text('Logout',
                      style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                  onPressed: signOut)
            ],),
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
                  ListTile(title: Text('Am I Fat?'), onTap: () {}),
                  ListTile(
                    title: Text('Recommeded Meal Plans'),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text('Set Reminder'),
                    onTap: () {},
                  ),
                ],
              ),
            ),
        ),
      );
    }
}
