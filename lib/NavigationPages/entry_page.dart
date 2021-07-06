import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:message_board_app/NavigationPages/log_in_page.dart';
import 'package:message_board_app/NavigationPages/register_page.dart';

class EntryPage extends StatefulWidget{
  @override 
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.lightBlue,
        accentColor: Colors.amberAccent

      ),
      home:Scaffold(       
      appBar: AppBar(title: Text('Our messageboard yuhhh'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //log in button, navigate to log in screen
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogInPage()),
                      );
                  },
                  child: Text('Log In'),
                  style: ElevatedButton.styleFrom(primary: Colors.blue[600], fixedSize: Size(100,10))
                ),
                //sized box to maintain distance
                SizedBox(width: 10),
                //register button, navigate to register screen
                ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text('Sign Up'),
                    style: ElevatedButton.styleFrom(primary: Colors.blue[600], fixedSize: Size(100, 10))
                )
              ]       
            ),
          ]
        )
      )
    )
    );
  }


}