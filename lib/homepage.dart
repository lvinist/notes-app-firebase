import 'package:flutter/material.dart';
import 'package:todo_app_firebase/user_agent.dart';
import 'package:todo_app_firebase/quote_widget.dart';
import 'package:todo_app_firebase/todo-widget.dart';
import 'package:todo_app_firebase/setting_page.dart';

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
      resizeToAvoidBottomInset: false,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
              backgroundColor: Colors.black,
              pinned: true,
              expandedHeight: MediaQuery.of(context).size.height * 0.4,
              flexibleSpace: FlexibleSpaceBar(
                titlePadding: EdgeInsets.only(left: 25),
                title: Text(
                  greetingMessage(),
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              )),
          SliverToBoxAdapter(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 25),
                child: Column(
                  children: [
                    QuoteWidget(),
                    SizedBox(
                      height: 20,
                    ),
                    TodoWidget(),
                    SizedBox(
                      height: 20,
                    )
                  ],
                )),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, bottom: 50),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              UserAgent(),
              IconButton(
                  icon: Icon(Icons.settings),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return SettingPage();
                    }));
                  })
            ],
          ),
        ),
      ),
    );
  }
}
