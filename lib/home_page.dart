import 'package:flutter/material.dart';

import 'package:message_board_app/NavigationPages/greeting.dart';
import 'package:message_board_app/NavigationPages/profile.dart';
import 'package:message_board_app/NavigationPages/lists.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    GreetingPage(Colors.green),
    MessagesPage(Colors.blue),
    //save space here
    ProfilePage(Colors.amber)
  ];

  void onTabPress(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        leading: Icon(Icons.menu),
      ),
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black45,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),

        onTap: onTabPress,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: ('Home'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.message),
            label: ('Messages'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: ('Profile'),
          )
        ],
        currentIndex:
            _currentIndex, // this will be set when a new tab is tapped
        selectedItemColor: Colors.amberAccent,
      ),
    );
  }
}
