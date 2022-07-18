import 'package:flutter/material.dart';
import 'package:flutterapp2/screens/home_screen.dart';
import 'package:flutterapp2/screens/second_screen.dart';
import 'package:flutterapp2/screens/third_screen.dart';

class MyMenuItems extends StatelessWidget {
  const MyMenuItems({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 5,
           child: ListTile(
            title: Text('Home Screen'),
            onTap: () {
              // Navigator.of(context)
              // .push(MaterialPageRoute(
              //   builder:(BuildContext context)=>HomeScreen()
              //   ),
              //   );

              Navigator.of(context).pushNamed('/');
            },
          ),
        ),
                Card(
          elevation: 5,
           child: ListTile(
            title: Text('Second Screen'),
            onTap: () {
              Navigator.of(context).pushNamed('/second');

            },
          ),
        ),
                Card(
          elevation: 5,
           child: ListTile(
            title: Text('Third Screen'),
            onTap: () {
                Navigator.of(context).pushNamed('/third');

            },
          ),
        ),
                
      ],
    );
  }
}