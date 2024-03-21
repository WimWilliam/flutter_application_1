import 'package:flutter/material.dart';

class StudentDetail extends StatelessWidget {

final int number;
  StudentDetail(this.number);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Student $number'),
      ),
      body: Center(
        child: Image.network("https://i.pravatar.cc/300?img=[$number]"),
      ),
    );
  }
}
