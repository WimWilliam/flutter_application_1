import 'package:flutter/material.dart';

class CourseDetail extends StatelessWidget {
  final String courseName;
  final String kp;
  CourseDetail(this.courseName, this.kp);

  @override
  Widget build(BuildContext context) {
    final String jadwal, kelas, sks;
    if (courseName == "Native Mobile Programming") {
      jadwal = "Rabu \n 09.45";
      kelas = "TB 01.01C";
      sks = "3 SKS";
    } else if (courseName == "Advance Native Mobile Programming") {
      jadwal = "Kamis \n 13.00";
      kelas = "TC 04B";
      sks = "3 SKS";
    } else if (courseName == "Emerging Techonolgy") {
      jadwal = "Kamis \n 07.00";
      kelas = "TC 04D";
      sks = "3 SKS";
    } else if (courseName == "Advance Computer Network") {
      jadwal = "Senin \n 07.00";
      kelas = "TG 03.04";
      sks = "3 SKS";
    } else if (courseName == "Reseacrh Methodology") {
      jadwal = "Selasa \n 13.00";
      kelas = "TF 03.02";
      sks = "3 SKS";
    } else if (courseName == "Spesial Topic In DSAI") {
      jadwal = "Senin \n 09.45";
      kelas = "LA 02.06A";
      sks = "3 SKS";
    } else {
      jadwal = "Selasa \n 07.00";
      kelas = "TB 01.09";
      sks = "3 SKS";
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('My Courses'),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$courseName', style: TextStyle(fontWeight: FontWeight.bold)),
          Container(
            width: 400,
            height: 100,
            child: Row(
              children: [
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Text('KP' + kp),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Text(jadwal),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Text(kelas),
                ),
                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(10),
                  height: 60,
                  width: 60,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.red)),
                  child: Text(sks),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
          )
        ],
      )),
    );
  }
}
