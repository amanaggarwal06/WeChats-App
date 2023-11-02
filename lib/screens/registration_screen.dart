import 'package:chats_app/components/rounded_button.dart';
import 'package:chats_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'chat_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class RegistrationScreen extends StatefulWidget {

  static String id = '/Registration';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _auth = FirebaseAuth.instance;
  late String  email;
  late String  password;
  bool showspinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ModalProgressHUD(
        inAsyncCall: showspinner,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Hero(
                tag: 'logo',
                child: Container(
                  height: 200.0,
                  child: Image.asset('images/logo.png'),
                ),
              ),
              SizedBox(
                height: 48.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.emailAddress,
                onChanged: (value) {

                  //Do something with the user input.
                  email = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your email',
                ),
              ),
              SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                obscureText: true,
                onChanged: (value) {
                  //Do something with the user input.
                  password = value;
                },
                decoration: kTextFieldDecoration.copyWith(
                  hintText: 'Enter your password',
                ),
              ),
              SizedBox(
                height: 24.0,
              ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 16.0),
            child: Material(
              elevation: 5.0,
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(30.0),
              child: MaterialButton(
                onPressed: () async {

                  setState(() {
                    showspinner = true;
                  });
                  try{
                    final newUser = await _auth.createUserWithEmailAndPassword(email:
                         email, password: password);
                    if(newUser != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }

                    setState(() {
                      showspinner = false;
                    });
                  }
                  catch(e){
                    print(e);
                  };
  },

                minWidth: 200.0,
                height: 42.0,

                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
            ],
          ),
        ),
      ),
    );
  }
}
