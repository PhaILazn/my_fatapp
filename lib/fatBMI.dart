import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_fatapp/mealRec.dart';

class BMICalc extends StatefulWidget {
  @override
  _BMICalcState createState() => _BMICalcState();
}

class _BMICalcState extends State<BMICalc> {
  final TextEditingController feetCon = new TextEditingController();
  final TextEditingController inchesCon = new TextEditingController();
  final TextEditingController weightCon = new TextEditingController();

  int feet, inches, weight;
  String fatStr = "";

  void dispose() {
    // Clean up the controller when the widget is disposed.
    feetCon.dispose();
    inchesCon.dispose();
    weightCon.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BMI Calculator"),
        ),
        resizeToAvoidBottomPadding: false,
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
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                  title: Text('Am I Fat?'),
                  onTap: () {
                    Navigator.pop(context);
                  }),
              ListTile(
                title: Text('Recommeded Meal Plans'),
                onTap: () {
                   Navigator.of(context).pop();
                    Navigator.of(context).pop();
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
            child: Column(
              children: <Widget>[
                _buildTextField(),
              ],
            )));
  }

  Widget _buildTextField() {
    final maxLines = 1;
    double numResult = 0;
    return Container(
        margin: EdgeInsets.all(80),
        child: Column(
          children: [
            Text(
                "Underweight = <18.5\nNormal weight = 18.5–24.9\nOverweight = 25–29.9\nObesity = BMI of 30 or greater"),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 20, 0.0, 0.0),
              child: new TextField(
                controller: feetCon,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: "Input Feet Here",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30, 0.0, 0.0),
              child: new TextField(
                controller: inchesCon,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: "Input Inches Here",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0.0, 30, 0.0, 0.0),
              child: new TextField(
                controller: weightCon,
                maxLines: maxLines,
                decoration: InputDecoration(
                  hintText: "Input Weight Here",
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  WhitelistingTextInputFormatter.digitsOnly
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                child: RaisedButton(
                  color: Colors.black,
                  elevation: 20,
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  onPressed: () {
                    setState(() {
                      feet = int.parse(feetCon.text);
                      inches = int.parse(inchesCon.text);
                      weight = int.parse(weightCon.text);
                      feet = feet * 12;
                      inches = inches + feet;
                      numResult = 703 * (weight / (inches * inches));
                      if (numResult > 30) {
                        fatStr = "YOU ARE FAT AND OBESE!!\nI recommend checking the Overweight section to see what to eat.";
                      } else if (numResult < 29.9 && numResult > 25) {
                        fatStr = "You're getting fat buddy.\nI recommend checking the Overweight section for foods.";
                      } else if (numResult < 24.9 && numResult > 18.5) {
                        fatStr = "You're perfect in every way.\nCheck the normal tab to see what to continue eating.";
                      } else if (numResult < 18.5) {
                        fatStr = "Yooo, you need to eat a munchie meal. Period.";
                      }
                    });
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                )),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 35, 0, 0),
                  child: AutoSizeText(
                    fatStr,
                    maxLines: 4,
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                )
          ],
        ));
  }
}
