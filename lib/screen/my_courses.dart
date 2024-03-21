import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/course_detail.dart';

class MyCourses extends StatelessWidget {
  final courses = [
    "Native Mobile Programing",
    "Advance Native Mobile Programming",
    "Emerging Techonolgy",
    "Advance Computer Network",
    "Reseacrh Methodology",
    "Spesial Topic In DSAI",
    "Web Framework Progamming"
  ];
   final kp = [
    "-",
    "C",
    "B",
    "ZB",
    "A",
    "A",
    "A",
    "A",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      title: Text('My Courses'),
    ),
    body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Divider(
            height: 50,
          ),
          CircleAvatar(
            backgroundImage: AssetImage("assets/images/wim.jpg"),
            radius: 60,
          ),
          Divider(
            height: 50,
          ),
          Container(
            child: Column(
              children: [
                Text("William Alexander Fahik",
                 style:TextStyle(fontWeight:FontWeight.bold),
                ),
                                   Text(""),
                  Text("160420095"),
                  Text("Information Technology"),
                  Text("Ganep 2023-2024"),
                 ],
                 )),
            Divider(
              height: 50,
            ),
            Container(
              width: 400,
              height: 310,
              child: GridView.count(crossAxisCount: 1,childAspectRatio: 20/4,
              primary: false,
              children: List.generate(courses.length, ((index){
                  return Container(
                    padding: EdgeInsets.all(10),
                    child: ElevatedButton(onPressed: (){

                      Navigator.push(context,
                      MaterialPageRoute(
                        builder: (context)=>CourseDetail(
                          courses[index], kp[index]
                        )));
                    },
                    child: Text(
                        courses[index] +  ' (' + kp[index]+ ')'


                    ),
                    ),
                  );

              }) 

              )
              ),
            )
        ],
      ),
    ),
    );
  }
}
