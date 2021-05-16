import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserAgent extends StatefulWidget {
  @override
  _UserAgentState createState() => _UserAgentState();
}

class _UserAgentState extends State<UserAgent> {
  final user = 'Alvin';
  Widget build(BuildContext context) {
    if (user != null) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(40)),
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 8),
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
              Text('|  $user')
            ],
          ),
        ),
      );
    }
    return Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(40)),
        child: InkWell(
          onTap: () {},
          child: Padding(
            padding:
                const EdgeInsets.only(top: 8, bottom: 8, right: 16, left: 8),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  child: ClipOval(
                    child: Image(
                        image: AssetImage('./assets/images/googleLogo.png')),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text('|  Sign in with Google')
              ],
            ),
          ),
        ));
  }
}
