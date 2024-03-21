import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/itemBasket.dart';
import 'package:flutter_application_1/class/recipe.dart';


class Basket extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Basket'),
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Text("Your basket "),
        ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: widRecipes(context),
        ),
        Divider(
          height: 100,
        ),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemBasket(1, 10)));
            },
            child: Text("Item 1")),
        ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ItemBasket(2, 14)));
            },
            child: Text("Item 2"))
      ])),
    );
  }

  List<Widget> widRecipes(BuildContext context) {
    List<Widget> temp = [];
    int i = 0;
    while (i < recipes.length) {
      Widget w = Container(
          margin: EdgeInsets.all(15),
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: -6,
              blurRadius: 8,
              offset: Offset(8, 7),
            ),
          ]),
          child: Card(
              child: Column(children: [
            Container(
                margin: EdgeInsets.all(15),
                child: Text(
                  recipes[i].name,
                  style: Theme.of(context).textTheme.headline5,
                )),
            Image.network(recipes[i].photo),
            Container(
              margin: EdgeInsets.all(20),
              child: Text(recipes[i].desc),
            )
          ])));
      temp.add(w);
      i++;
    }
    return temp;
  }
}
