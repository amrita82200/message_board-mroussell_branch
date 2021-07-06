import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:message_board_app/home_page.dart';


class RegisterPage extends StatefulWidget{
  @override 
  _RegisterPageState createState() => new _RegisterPageState();
} 

class _RegisterPageState extends State<RegisterPage> {

late String _firstName, _lastName,_email, _password, _username;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //instance of firebase auth
  final auth = FirebaseAuth.instance;

  //instance of cloud firestore
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //used to get user's unique id after registration
  late String currentUserID = auth.currentUser!.uid;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(  
      appBar: AppBar(title: Text('Sign Up'), centerTitle: true),
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                //start of first name text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField( 
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter your first name';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _firstName = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'First Name'
                    ),                           
                  ),
                ),
                //start of last name text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter your last name';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _lastName = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Last Name'
                    )
                  ),
                ),
                //start of last name text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter desired username';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _username = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Username'
                    )
                  ),
                ),
                //start of email text box field
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
                      border: OutlineInputBorder(),
                      labelText: 'E-mail'
                    )
                  ),
                ),
                //start of password text box field
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  child: TextFormField(
                    validator: (String? input){
                      //if nothing is input into field, return error
                      if(input == null || input.isEmpty){
                        return 'Please enter a password';
                      }
                      return null;
                    },
                    onChanged: (value){
                      setState((){
                        _password = value.trim();
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password: at least 6 characters'
                    ),
                    //hides characters when typing
                    obscureText: true,
                  ),
                ),
                //start of Register button
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ElevatedButton(
                        onPressed: () {
                          signUp(_firstName, _lastName, _email, _password);
                        },
                        child: Text('Register'),
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
  //method to sign up through firebase auth
  Future<String?> signUp(String _firstName, String _lastName, String _email, String _password) async{
    try{
      await auth.createUserWithEmailAndPassword(email: _email, password: _password);
       
      //adds user info to collection 'users' 
      CollectionReference users = firestore.collection('users');
      //sets document ID as the userID
      users.doc(currentUserID).set({
        'first_name': _firstName,
        'last_name': _lastName,
        'username': _username,
        'registration_datetime': DateTime.now(),
        'user_id': currentUserID
      }).then((value)=>print("User Added")).catchError((error)=>print("Failed to add user:$error"));
      
      //moves user to homepage screen
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> MyHomePage(title: 'Welcome')));

      return 'Signed Up';
    } on FirebaseAuthException catch(e){
      return e.message;
    }
  }
}