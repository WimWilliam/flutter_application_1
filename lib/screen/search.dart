import 'package:flutter/material.dart';

class Search extends StatelessWidget {


  void updateList(String value){
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 2, 158),
    appBar: AppBar(
      backgroundColor: Color.fromARGB(255, 33, 2, 156),
      elevation: 0,
      
    ),
    body: Padding(
      padding: EdgeInsets.all(16),
      child: Column(mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Search for your movie", style: TextStyle(color: Colors.white,fontSize: 22.0,fontWeight: FontWeight.bold,
        ),
        ),
        SizedBox(
          height: 20.0,
        ),
        TextField(
          decoration: InputDecoration(
            filled: true,
            fillColor: Color(0xff302360),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none),
            hintText: "eg:MAN OF STEEL",
            prefixIcon: Icon(Icons.search),
            prefixIconColor: Colors.purple.shade900,
          ),
        ),
        SizedBox(height: 20.0,),
        Expanded(child: ListView())
      ],),
    ),
    );
  }
}
