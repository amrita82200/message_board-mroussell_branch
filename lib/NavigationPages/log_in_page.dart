import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:message_board_app/home_page.dart';

class LogInPage extends StatefulWidget{
  @override 
  _LogInPageState createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {

  late String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //instance of firebase auth
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Log In'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
          key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Email')
                ),
                //Start of email text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField( 
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter your E-mail';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _email = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    )
                  ),
                ),
                //Start of password text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text('Password')
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter a password';
                      }
                      if(input.length<6){
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _password = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder()
                    ),
                    //hides characters when typing
                    obscureText: true,
                  ),
                ),
                //start of Log in button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                        onPressed: () {
                          signIn(_email, _password);      
                        },
                        child: Text('Log In'),
                        style: ElevatedButton.styleFrom(primary: Colors.blue[600],
                        fixedSize: Size(400, 10)
                        )      
                  ),
                ),
              ] 
            )       
          )
        )
      )
    );
  }
  //method to sign in through firebase auth
  Future<String?> signIn(String _email, String _password) async{
    try{
      await auth.signInWithEmailAndPassword(email: _email, password: _password);

      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Welcome')));
      return 'Signed In';
    } on FirebaseAuthException catch(e){
      if(e.code == 'user-not-found'){
        return 'No user found for that email';
      }
      else if(e.code =='wrong-password'){
        return 'Wrong password';
      }
    }
  }
}



