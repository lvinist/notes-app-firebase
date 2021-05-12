import 'package:flutter/material.dart';
import 'package:todo_app_firebase/user_agent.dart';
import 'package:todo_app_firebase/quote_widget.dart';
import 'package:todo_app_firebase/todo-widget.dart';

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  UserAgent(),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: IconButton(
                          icon: Icon(Icons.settings), onPressed: () {}))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
