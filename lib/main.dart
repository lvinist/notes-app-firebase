import 'package:flutter/material.dart';
import 'package:notes_app_firebase/model/quotes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

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
      theme: ThemeData(brightness: Brightness.dark, accentColor: Colors.grey),
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
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
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(border: Border.all(color: Colors.white)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                greetingMessage(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
