import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart'; 
import 'package:flutter_application_1/class/questionbank.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() => _QuizState();
}



class _QuizState extends State<Quiz> {
  int _initialValue =10;
  int _hitung = 10;
  late Timer _timer;
  List<QuestionObj> _questions = [];
  int _question_no = 0;
  int _point=0;

   void checkAnswer(String answer) {

    setState(() {
      if (answer == _questions[_question_no].answer) {
        _point += 100;
      }else
        _question_no++;
      if (_question_no > _questions.length - 1) _question_no = 0;
      _hitung = _initialValue;

    });
  }



   @override // add “late” to initialize it later in initState() @override
  void initState() {
    super.initState();
       _questions.add(QuestionObj("Not a member an Avenger", 'Ironman',
      'Spiderman', 'Thor', 'Hulk Hogan', 'Hulk Hogan'));
      _questions.add(QuestionObj("Not a member of Teletubbies", 'Dipsy', 'Patrick',
      'Laalaa', 'Poo', 'Patrick'));
      _questions.add(QuestionObj("Not a member of justice league", 'batman',
      'superman', 'flash', 'aquades', 'aquades'));

    starttimer();
  }
    @override
  void dispose() {
    _timer.cancel();
    _hitung = 0;
    super.dispose();
  }


   Timer starttimer() {
     return _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
    setState(() {
      if(_hitung > 0 )
        _hitung--;
      else
          
        showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text('Time App'),
                          content: Text('Quiz is finished'),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () => Navigator.pop(context, 'OK'),
                              child: const Text('OK'),
                            ),
                          ],
                        ));
                        starttimer().cancel();
      //  _initialValue = 10;
        //_hitung++;
    });
  }
  );
   }






  @override
  Widget build(BuildContext context) {
    // returnint _hitung = 0;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Center(
          child: Column(children: <Widget>[
        CircularPercentIndicator(
            radius: 120.0,
            lineWidth: 20.0,
            percent: 1 - (_hitung / _initialValue),
            center: Text(formatTime(_hitung)),
            progressColor: Colors.red,
          ),

        // Text(formatTime(_initialValue),
        //     style: const TextStyle(
        //       fontSize: 24,
        //     )),
            ElevatedButton(
              onPressed: (){
                setState(() {
                    _timer.isActive?_timer.cancel(): starttimer();
                });
              }, child: Text(_timer.isActive ? "Stop" : "Start") //Text("STOP"),
            ),
            Text(_questions[_question_no].narration),
                     TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_a);
            },
            child: Text("A. " + _questions[_question_no].option_a)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_b);
            },
            child: Text("B. " + _questions[_question_no].option_b)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_c);
            },
            child: Text("C. " + _questions[_question_no].option_c)),
        TextButton(
            onPressed: () {
              checkAnswer(_questions[_question_no].option_d);
            },
            child: Text("D. " + _questions[_question_no].option_d)),
 

            
      ])),
    );

  }
   String formatTime(int hitung) {
    var hours = (hitung ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((hitung % 3600) ~/ 60).toString().padLeft(2, '0');	
    var seconds = (hitung % 60).toString().padLeft(2, '0');
    return "$hours:$minutes:$seconds";
  }


  // void checkAnswer(String answer) {
  //   setState(() {
  //     if (answer == _questions[_question_no].answer) {
  //       _point += 100;
  //     }
  //     _question_no++;
  //     if (_question_no > _questions.length - 1) _question_no = 0;
  //     _hitung = _initialValue;
  //   });
  // }

}