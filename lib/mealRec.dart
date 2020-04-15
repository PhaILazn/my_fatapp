import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:my_fatapp/components/popup.dart';
import 'package:my_fatapp/components/popup_content.dart';

class MealRecommendations extends StatefulWidget {
  @override
  _MealRecommendationsState createState() => _MealRecommendationsState();
}

class _MealRecommendationsState extends State<MealRecommendations> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.purple,
                  title: Text("Meal Recommendations"),
                  bottom: TabBar(
                    tabs: <Widget>[
                      Text('Underweight'),
                      Text('Normal'),
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
                            SizedBox(
                              width: 400,
                              height: 250,
                              child: IconButton(
                                icon: Image.asset(
                                  'assets/munchiemeal.jpg',
                                ),
                                iconSize: 275,
                                onPressed: () {
                                  showPopup(context, _popupMunchie());
                                },
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'One Pot Garlic Parmesan Pasta',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/pasta.jpeg',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupPasta());
                              },
                            ),
                          ]),
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
                            IconButton(
                              icon: Image.asset(
                                'assets/grilledChicken.png',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupGrilledChicken());
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Teriyaki Lean Ground Beef',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/teriyakibeef.jpg',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupTeriyakiBeef());
                              },
                            ),
                          ]),
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Thai Red Duck with Mango Sticky Rice',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/thai_red_duck_with_mango_sticky_rice.jpg',
                              ),
                              iconSize: 250,
                              onPressed: () {
                                showPopup(context, _popupThaiRedDuck());
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
                            IconButton(
                              icon: Image.asset(
                                'assets/grilledChicken.png',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupGrilledChicken());
                              },
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                              child: AutoSizeText(
                                'Turmeric broth with chicken and ginger dumplings',
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 25),
                              ),
                            ),
                            IconButton(
                              icon: Image.asset(
                                'assets/broth.jpg',
                              ),
                              iconSize: 200,
                              onPressed: () {
                                showPopup(context, _popupBroth());
                              },
                            ),
                          ]),
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
                child: Text(
                  "Ingredients:",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                  padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                  child: AutoSizeText(
                      "If you're underweight you should be intaking in more calories and more servings. Any of the food options here works."))
            ]));
  }

  Widget _popupPasta() {
    return SingleChildScrollView(
        child: Container(
            height: 625,
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
                    child: Text(
                      "Prep Time: 25 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Text("- 2 tablespoons unsalted butter\n"
                          "- 4 cloves garlic, minced\n"
                          "- 2 cups chicken broth\n"
                          "- 1 cup milk, or more, as needed\n"
                          "- 8 ounces uncooked fettuccine\n"
                          "- Kosher salt and freshly ground black pepper, to taste\n"
                          "- 1/4 cup freshly grated Parmesan cheese\n"
                          "- 2 tablespoons chopped fresh parsley leaves")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                      child: Text(
                          "1. Melt butter in a large skillet over medium high heat. Add garlic and cook, stirring frequently, until fragrant, about 1-2 minutes.\n"
                          "2. Stir in chicken broth, milk and fettuccine; season with salt and pepper, to taste.\n"
                          "3. Bring to a boil; reduce heat and simmer, stirring occasionally, until pasta is cooked through, about 18-20 minutes. Stir in Parmesan. If the mixture is too thick, add more milk as needed until desired consistency is reached.\n"
                          "4. Serve immediately, garnished with parsley, if desired."))
                ])));
  }

  Widget _popupSalmon() {
    return SingleChildScrollView(
        child: Container(
            height: 725,
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
                    child: Text(
                      "Prep Time: 30 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Text(
                          "- Salmon\n- Lemon\n- Black Pepper\n- Herbs\n- Olive Oil\n- Brown Rice")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: Text(
                          "1.First, place your salmon on a plate and allow to come to room temperature."
                          " This will help it cook evenly all the way though.\n"
                          "2. Next, grab a large piece of aluminum foil, and place it on your baking sheet. Spray"
                          " lightly with nonstick spray, and lay down a row of your fresh herbs (I used thyme) and"
                          " lemon slices.\n3. Take your piece of salmon, and lay it over the herbs and lemon. Top it with"
                          " lemon zest, lemon juice, and salt and pepper. Flavor baby!\n4. Now, you’re ready to seal up"
                          " the packet of yummy flavors and salmon. Make sure there’s enough to fully cover the salmon piece,"
                          " leaving some room for air to circulate.\n5. Then, move your baking sheet with the foil packet to"
                          " the oven and bake at 375 degrees F for 15-20 minutes, until the salmon flakes easily with a fork.\n6. When"
                          " you’re ready to serve, top your salmon with additional fresh herbs (I added some extra thyme) or lemon juice. Voilà!"))
                ])));
  }

  Widget _popupGrilledChicken() {
    return SingleChildScrollView(
        child: Container(
            height: 900,
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
                    child: Text(
                      "Prep Time: 40 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: AutoSizeText(
                          "- 2 pounds skinless, boneless chicken breasts\n"
                          "- 2 tablespoons extra virgin olive oil for the marinade, plus more for grilling\n"
                          "- Grated zest from 2 limes\n"
                          "- Juice from 2 limes (about 1/4 cup)\n"
                          "- 3 tablespoons chopped cilantro\n"
                          "- 1/2 teaspoon sugar\n"
                          "- 1/2 teaspoon salt\n"
                          "- 1/4 teaspoon black pepper\n"
                          "- Lime wedges, fresh sprigs of cilantro, and slices of avocado, to serve\n- 1 Cup Asparagus\n- 1 1/2 Cup Quinoa")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 15, 0),
                      child: AutoSizeText(
                          "1. Place the chicken breasts between two piece of plastic wrap or wax paper and pound to an even thickness with a meat mallet or rolling pin.\n"
                          "2. Mix the olive oil, lime zest, lime juice, cilantro, sugar, salt, and pepper together in a large bowl. Add the chicken and massage the marinade into the chicken. Cover and chill for at least 30 minutes, and up to 4 hours or overnight.\n"
                          "3. Preheat a gas or charcoal grill for medium-high heat grilling, or until you can hold your hand about an inch over the grates for 1 second.\n"
                          "4. Remove the chicken breasts from the refrigerator. Remove them from the marinade and pat them dry with paper towels. Coat the chicken breasts with some olive oil.\n"
                          "5. Soak a paper towel in a little more oil and use tongs to wipe the grill grates. When the grill is hot, place the chicken breasts on the grill. Grill for a few minutes on each side, until just cooked through.")),
                ])));
  }

  Widget _popupTeriyakiBeef() {
    return SingleChildScrollView(
        child: Container(
            height: 675,
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
                    child: Text(
                      "Prep Time: 10 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: AutoSizeText("- 4 oz lean ground beef 97% lean"
                          "- 1 cup finely diced onion*\n"
                          "- 1 teaspoon minced garlic\n"
                          "- 1 teaspoon minced fresh ginger or about ¼ teaspoon dried ground ginger\n"
                          "- ¾ cup thick teriyaki sauce such as Soy Vay Veri Veri Teriyaki Marinade & Sauce\n"
                          "1/2 cup carrots\n"
                          "1 1/2 cup white rice\n"
                          "1/2 cup peas")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: AutoSizeText(
                          "1. In a large skillet preheat 1 teaspoon sesame oil over medium-high heat for about 1 minute. The sesame oil adds great flavor to the dish, but if you don’t have any you can substitute with canola or vegetable oil.\n"
                          "2. Add beef, onion, garlic, ginger, carrots, and peas to the skillet. Cook, breaking up the meat as you stir, until the beef is no longer pink and the onion is tender (about 5-7 minutes). Drain, and return meat to skillet.\n"
                          "3. Stir teriyaki sauce into the beef mixture. Bring to a low simmer and cook for an additional 3-5 minutes, just until sauce thickens slightly.\n"
                          "4. Serve over rice, in tortillas, or in lettuce wraps.")),
                ])));
  }

  Widget _popupThaiRedDuck() {
    return SingleChildScrollView(
        child: Container(
            height: 1000,
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
                    child: Text(
                      "Prep Time: 30 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                      child: AutoSizeText(
                          "- 2 duck breasts, skin removed and discarded\n- 1 tbsp Thai red curry paste\n- zest and juice 1 lime"
                          ", plus extra wedges to serve\n- 140g jasmine rice\n- 125ml light coconut milk, from a can\n"
                          "- 140g frozen peas\n- 50g beansprouts\n- ½ red onion, diced\n- 100g fresh pineapple, cubed\n- 1 red chilli,"
                          "deseeded and finely chopped\n- ¼ small pack coriander, stalks finely chopped, leaves roughly chopped")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                      child: AutoSizeText(
                          "1.Sit a duck breast between 2 sheets of cling film on a chopping board. Use a rolling"
                          "pin to bash the duck until it is 0.5cm thick. Repeat with the other breast, then put them both in"
                          "a dish. Mix the curry paste with the lime zest and juice, and rub all over the duck. Leave to marinate"
                          "at room temperature for 20 mins.\n\n"
                          "2. Meanwhile, tip the rice into a small saucepan with some salt. Pour over the coconut milk with 150ml"
                          "water. Bring to a simmer, then cover the pan, turn the heat down low and cook for 5 more mins. Stir in"
                          "the peas, then cover, turn the heat off and leave for another 10 mins. Check the rice - all the liquid"
                          "should be absorbed and the rice cooked through. Boil the kettle, put the beansprouts and red onion in a"
                          "colander and pour over a kettleful of boiling water. Stir the beansprouts and onion into the rice with"
                          "the pineapple, chilli and coriander stalks, and some more salt if it needs it, and put the lid back on"
                          "to keep warm.\n\n"
                          "3. Heat a griddle pan and cook the duck for 1-2 mins each side or until cooked to your liking. Slice the"
                          "duck, stir most of the coriander leaves through the rice with a fork to fluff up, and serve alongside the"
                          "duck, scattered with the remaining coriander."))
                ])));
  }

  Widget _popupBroth() {
    return SingleChildScrollView(
        child: Container(
            height: 900,
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
                    child: Text(
                      "Prep Time: 30 min\nIngredients:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 5, 0),
                      child: AutoSizeText("- ginger 50g, sliced\n"
                          "- light chicken stock 1.5 litres\n"
                          "- spring onions 3, greens and whites separated\n"
                          "- star anise 2\n"
                          "- ground turmeric 2-3 tsp\n"
                          "- baby leaf greens 200g, chopped\n"
                          "- cooked egg noodles 300g\n"
                          "- red chilli 1, finely chopped\n")),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Text(
                        "Dumpling Ingredients: ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child:
                          AutoSizeText("- chicken or turkey breast mince 500g\n"
                              "- ginger 1 tbsp, finely grated\n"
                              "- red chilli 1/2, seeded and finely chopped\n"
                              "- coriander a handful, finely chopped\n"
                              "- sesame oil\n"
                              "- cornflour 1 tbsp\n"
                              "- egg white 1\n"
                              "- white pepper\n")),
                  Padding(
                    padding: EdgeInsets.fromLTRB(15, 10, 0, 0),
                    child: Text(
                      "Steps:",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                      padding: EdgeInsets.fromLTRB(15, 10, 10, 0),
                      child: AutoSizeText(
                          "1. Put the sliced ginger, chicken stock, spring onion greens, star anise and turmeric in a large pan. Bring to a simmer and cook with a lid on for 20 minutes.\n"
                          "2. Meanwhile, finely chop the spring onion whites and put in a bowl with the chicken mince, grated ginger, chilli, coriander, 1 tsp of sesame oil, the cornflour and egg white. Season with salt and white pepper then mix well and roll into balls.\n"
                          "3. Strain the broth and return it to the pan. Add the chicken dumplings and simmer for 8-10 minutes until cooked through (add the greens and the noodles for the last couple of minutes). Finish with the chilli and a drizzle of sesame oil, if you like."))
                ])));
  }
}
