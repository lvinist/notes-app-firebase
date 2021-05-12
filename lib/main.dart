import 'package:flutter/material.dart';
import 'package:notes_app_firebase/quote_widget.dart';
import 'package:notes_app_firebase/todo-widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          accentColor: Colors.grey,
          scaffoldBackgroundColor: Colors.black,
          brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String greetingMessage() {
    var timeNow = DateTime.now().hour;

    if (timeNow <= 12) {
      return 'Good Morning';
    } else if ((timeNow > 12) && (timeNow <= 16)) {
      return 'Good Afternoon';
    } else if ((timeNow > 16) && (timeNow < 20)) {
      return 'Good Evening';
    } else {
      return 'Good Night';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(40),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: Column(
            children: [
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    greetingMessage(),
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  QuoteWidget(),
                  SizedBox(
                    height: 20,
                  ),
                  TodoWidget(),
                ],
              )),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(40)),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 8, bottom: 8, right: 16, left: 8),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.blue,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text('|  Alvin')
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
