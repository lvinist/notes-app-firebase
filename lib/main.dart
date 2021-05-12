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

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

Future<Quote> fetchQuote() async {
  final String uri = 'https://favqs.com/api/qotd';
  final response = await http.get(Uri.parse(uri));

  if (response.statusCode == 200) {
    return Quote.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failde to fetch quote');
  }
}

class _HomePageState extends State<HomePage> {
  Future<Quote> quote;

  @override
  void initState() {
    super.initState();
    quote = fetchQuote();
  }

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
          margin: EdgeInsets.only(top: 40, bottom: 20, left: 20, right: 20),
          decoration:
              BoxDecoration(border: Border.all(color: Colors.transparent)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                greetingMessage(),
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              FutureBuilder<Quote>(
                  future: quote,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return SafeArea(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(snapshot.data.quoteText,
                              style: TextStyle(
                                  fontStyle: FontStyle.italic, fontSize: 16)),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            '- ${snapshot.data.quoteAuthor} -',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w200),
                          ),
                        ],
                      ));
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return CircularProgressIndicator();
                  }),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
