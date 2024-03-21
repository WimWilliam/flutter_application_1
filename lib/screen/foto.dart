import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Foto extends StatelessWidget {
  List<Widget> cats() {
    List<Widget> temp = [];
    int i = 0;
    while (i < 15) {
      Widget w = Image.network(
          "https://placekitten.com/120/120?image=" + i.toString());
      temp.add(w);
      i++;
    }
    return temp;
  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Foto'),
    ),
    body: Center(
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.deepPurpleAccent,
            alignment: Alignment.center,
            width: 200.0,
            height: 200.0,
            child: AspectRatio(aspectRatio: 4/1,
            child: Container(color:Colors.redAccent ,),),
          ),
          Container(
            color: Colors.blueAccent,
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            height: 300,
            width: 300,
            child: Card(child: Text('Hello World')),
          ),
          Container(
            width: 400,
                height: 400,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius:
                      BorderRadius.only(bottomLeft: Radius.circular(100)),
                  image: DecorationImage(
                    image: NetworkImage('https://i.pravatar.cc/400?img=60'),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(
                    color: Colors.indigo,
                    width: 10,
                  ),
                  
                ),
          ),
          Divider(
            height: 60,
          ),
          Row(
             children: [
                  Image.network('https://i.pravatar.cc/100?img=1'),
                  Image.network('https://i.pravatar.cc/100?img=2'),
                  Image.network('https://i.pravatar.cc/100?img=3'),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
          Divider(
            height: 20,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.network('https://i.pravatar.cc/100?img=4'),
                    Image.network('https://i.pravatar.cc/100?img=5'),
                    Image.network('https://i.pravatar.cc/100?img=6'),
                    Image.network('https://i.pravatar.cc/100?img=7'),
                    Image.network('https://i.pravatar.cc/100?img=8'),
                    Image.network('https://i.pravatar.cc/100?img=9'),
                    Image.network('https://i.pravatar.cc/100?img=10'),
                    Image.network('https://i.pravatar.cc/100?img=11'),
                  ],
            ),
          ),
          Divider(
            height: 20,
          ),
          Stack(
            children: [
                  Image.network("https://placekitten.com/420/320?image=12"),
                  //Image.asset("assets/images/missing.png")
                ],
          ),
          Divider(
            height: 20,
          ),
          Container(
            height: 500,
            child: GridView.count(crossAxisCount: 3,children: cats(),),
          ),
          Divider(
            height: 200,
          )



        ])
        
    ),
    );
  }
}
