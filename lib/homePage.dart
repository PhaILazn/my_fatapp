import 'package:flutter/material.dart';


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("Testing")),
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
        )
    )
    ); 
  }
}