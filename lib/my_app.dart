import 'package:flutter/material.dart';
import 'home_page.dart';
//import 'NavigationPages/entry_page.dart';
//import 'NavigationPages/greeting.dart';
//import 'NavigationPages/log_in_page.dart';
//import 'NavigationPages/profile.dart';
//import 'NavigationPages/register_page.dart';
//import 'NavigationPages/messages.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.lightBlue,
          accentColor: Colors.amberAccent),
      home: MyHomePage(title: 'Snack Chat'),
    );
  }
}
