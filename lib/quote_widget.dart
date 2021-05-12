import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app_firebase/model/quotes.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class QuoteWidget extends StatefulWidget {
  @override
  _QuoteWidgetState createState() => _QuoteWidgetState();
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

class _QuoteWidgetState extends State<QuoteWidget> {
  Future<Quote> quote;

  @override
  void initState() {
    super.initState();
    quote = fetchQuote();
  }

  Widget build(BuildContext context) {
    return FutureBuilder<Quote>(
        future: quote,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(snapshot.data.quoteText,
                    style:
                        TextStyle(fontStyle: FontStyle.italic, fontSize: 16)),
                SizedBox(
                  height: 8,
                ),
                Text(
                  '- ${snapshot.data.quoteAuthor} -',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w200),
                ),
              ],
            ));
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return CircularProgressIndicator();
        });
  }
}
