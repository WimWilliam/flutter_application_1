import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/studentdetail.dart';

class Studentlist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('Student List'),
    ),
    body: Center(
        child: Column(children: [
          Text("Choose:"),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(50)));
              },
              child: Text("Student  #1")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(35)));
              },
              child: Text("Student #50")),
             ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => StudentDetail(70)));
              },
              child: Text("Student #70"))
        ]),
      ),
    );
  }
}
