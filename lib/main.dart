import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/about.dart';
import 'package:flutter_application_1/screen/basket.dart';
import 'package:flutter_application_1/screen/history.dart';
import 'package:flutter_application_1/screen/home.dart';
import 'package:flutter_application_1/screen/my_courses.dart';
import 'package:flutter_application_1/screen/quiz.dart';
import 'package:flutter_application_1/screen/search.dart';
import 'package:flutter_application_1/screen/studentlist.dart';
import 'package:flutter_application_1/screen/foto.dart';
import 'package:flutter_application_1/screen/addRecipe.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes:{
        'about':(context)=>About(),
        'basket':(context)=>Basket(),
        'studentlist':(context) => Studentlist(),
        'foto':(context) => Foto(),
        'myCourses':(context)=>MyCourses(),
        'addRecipe':(context)=>AddRecipe(),
        'quiz':(context) => Quiz()
        
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 143, 212, 244)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _currentIndex = 0;
  final List<Widget> _screens =[Home(),Search(),History()];
  final List<String> _title = ['Home', 'Search', 'History'];


  //Runes _myEmoji = Runes('\u{1f608}');
  String _emoji = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void setEmojiCounter() {
    setState(() {
      Runes smileEmoji = Runes('\u{1f600}');
      Runes angryEmoji = Runes('\u{1f611}');

      if (_counter % 5 == 0) {
        _emoji = _emoji + String.fromCharCodes(angryEmoji);
      } else {
        _emoji = _emoji + String.fromCharCodes(smileEmoji);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
       
        title: Text(_title[_currentIndex])

      ),
      body: _screens[_currentIndex],

      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text('Belajar Flutter ' +String.fromCharCodes(_myEmoji)),
      //       const Text(
      //         'You have pushed the button this many times:',
      //       ),
      //       Text(
      //         '$_counter',
      //         style: Theme.of(context).textTheme.headlineMedium,
      //       ),
      //       Text('$_emoji'),
      //     ],
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _incrementCounter();
          setEmojiCounter();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      drawer: Drawer(
        elevation: 16.0,
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
                accountName: Text("tmr"),
                accountEmail: Text("tmr@gmail.com"),
                currentAccountPicture: CircleAvatar(
                    backgroundImage:
                        NetworkImage("https://i.pravatar.cc/150"))),
            ListTile(
              title: new Text("Inbox"),
              leading: new Icon(Icons.inbox),
            ),
            ListTile(
              title: new Text("Shoping Cart"),
              leading: new Icon(Icons.shop),
              onTap: (){
                Navigator.popAndPushNamed(context,'basket');
              },
            ),
            ListTile(
                title: Text("About"),
                leading: Icon(Icons.help),
                onTap: () {
                Navigator.popAndPushNamed(context,'about')
                ;
            }),
            ListTile(
                title: Text("Student List"),
                leading: Icon(Icons.account_box_outlined),
                onTap: () {
                Navigator.popAndPushNamed(context,'studentlist')
                ;
            }),ListTile(
              title: Text("Foto"),
              leading: Icon(Icons.image),
              onTap: (){
                Navigator.popAndPushNamed(context,'foto');
              },
            ),
            ListTile(
              title: Text("My Courses"),
              leading: Icon(Icons.list),
              onTap: (){
                Navigator.pushNamed(context, "myCourses");
              },
            ),
            ListTile(
              title: Text("Add Recipe"),
              leading: Icon(Icons.list),
              onTap: (){
                Navigator.pushNamed(context, "addRecipe");
              },
            ),
             ListTile(
              title: Text("Quiz"),
              leading: Icon(Icons.question_answer),
              onTap: (){
                Navigator.pushNamed(context, "quiz");
              },
             )
          ],
        ),
      ),
      persistentFooterButtons: <Widget>[
   ElevatedButton(
    onPressed: () {},
    child: Icon( Icons.remove_circle,size: 30,color: Color.fromRGBO(247, 3, 3, 1),),
   ),
   ElevatedButton(
    onPressed: () {},
    child: Icon( Icons.add_circle,size: 30,),
   ),
  ],
  bottomNavigationBar: BottomNavigationBar(

          currentIndex: _currentIndex,
          fixedColor: Colors.teal,
          items: [
            BottomNavigationBarItem(
              label: "Home",
              icon: Icon(Icons.home,size: 40,color: Color.fromRGBO(100, 80, 55, 1.0),),
            ),
            BottomNavigationBarItem(
              label: "Search",
              icon: Icon(Icons.search,size: 40,color:Color.fromRGBO(100, 110, 255, 1.0),),
            ),
            BottomNavigationBarItem(
              label: "History",
              icon: Icon(Icons.history,size: 40,color:Color.fromRGBO(100, 50, 155, 1.0),),
            ),
            
          ],
          onTap: (int index) {

           setState(() {
            _currentIndex = index;
            });
          }),


    );
  }
}