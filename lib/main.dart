import 'package:flutter/material.dart';
import 'package:flutterapp2/screens/second_screen.dart';
import 'package:flutterapp2/screens/third_screen.dart';
import 'package:flutterapp2/utils/theme.dart';

import 'screens/home_screen.dart';

 void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: myThemeData ,
    //  home: HomeScreen(),
    initialRoute: '/third',
      routes: {
        '/':(context) => HomeScreen(),
        '/second':(context) => SecondScreen(),
        '/third':(context) => ThirdScreen(),

      },
      
    );
  }
}