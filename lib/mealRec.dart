import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fatapp/components/popup.dart';
import 'package:my_fatapp/components/popup_content.dart';
import 'package:my_fatapp/fatBMI.dart';

class MealRecommendations extends StatefulWidget {
  @override
  _MealRecommendationsState createState() => _MealRecommendationsState();
}

class _MealRecommendationsState extends State<MealRecommendations> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.purple,
                  title: Text("Meal Recommendations"),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Text('Underweight'),
                      Text('Normal Weight'),
                      Text('Overweight')
                    ],
                  ),
                  leading: new IconButton(
                    icon: new Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ),
                body: SingleChildScrollView(
                    child: Container(
                  height: 1000,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.pink, Colors.purple]),
                  ),
                  child: TabBarView(
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Jack\'s Munchie Meal',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/munchiemeal.jpg',
                              ),
                              iconSize: 275,
                              onPressed: () {
                                showPopup(context, _popupMunchie());
                              },
                            ),
                          ]
                      ),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Baked Lemon Pepper Salmon',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/salmon.jpg',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupSalmon());
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Grilled Lime Cilantro Chicken',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            Image.asset(
                              'assets/grilledChicken.png',
                              height: 200,
                            )
                          ]),
                      Icon(Icons.directions_bike),
                    ],
                  ),
                )))));
  }

  showPopup(BuildContext context, Widget widget, {BuildContext popupContext}) {
    Navigator.push(
      context,
      PopupLayout(
        top: 30,
        left: 30,
        right: 30,
        bottom: 50,
        child: PopupContent(
          content: Scaffold(
            appBar: AppBar(
              title: Text('Recipe'),
              leading: new Builder(builder: (context) {
                return IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    try {
                      Navigator.pop(context); //close the popup
                    } catch (e) {}
                  },
                );
              }),
            ),
            resizeToAvoidBottomPadding: false,
            body: widget,
          ),
        ),
      ),
    );
  }

  Widget _popupSalmon() {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.pink, Colors.purple]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child:Text("Ingredients:\nPrep Time: 30 min",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                 child: Text("- Salmon\n- Lemon\n- Black Pepper\n- Herbs\n- Olive Oil\n")
               )
            ]
        )
    );
  }
  Widget _popupMunchie() {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.pink, Colors.purple]),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                child:Text("Ingredients:",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
               ),
               Padding(
                 padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                 child: AutoSizeText("If you're underweight you should be intaking in more calories and more servings. Any of the food options here works.")
               )
            ]
        )
    );
  }

}

