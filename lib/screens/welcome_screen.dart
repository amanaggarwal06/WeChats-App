import 'package:flutter/material.dart';
import 'package:chats_app/screens/login_screen.dart';
import 'package:chats_app/screens/registration_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chats_app/components/rounded_button.dart';

class WelcomeScreen extends StatefulWidget {
  static String id = '/Welcome';
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin{

  // this animation controller is added because it helps in animation tickering counting;
  late Animation animation;
  late AnimationController controller;
  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    controller = AnimationController(
      duration: Duration(seconds: 1),
        vsync: this
    );

    // tween is used when we want to change something from begin to end.
     animation = ColorTween(begin: Colors.black, end: Colors.white).animate(controller);
    controller.forward();
    controller.addListener(() {
      setState(() {});
      print('${controller.value.toInt()}%');
    });

  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: animation.value,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: Container(
                    child: Image.asset('images/logo.png'),
                    height: 41.0,
                  ),
                ),
                AnimatedTextKit(animatedTexts:
                    [
                      TypewriterAnimatedText(
                        'Flash Chat',
                        textStyle: TextStyle(
                          fontSize: 40.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                        ),
                      ),
                    ]
                ),

              ],
            ),
            SizedBox(
              height: 48.0,
            ),
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: Colors.lightBlueAccent,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, LoginScreen.id);
              },

            minWidth: 200.0,
            height: 42.0,

            child: Text(
              'Log In',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),

            // RoundedButton(colour: Colors.blueAccent, onpressed: (){
            //   Navigator.pushNamed(context, RegistrationScreen.id);
            // },
            // button_name: 'Registration',
            // )
      Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Material(
          elevation: 5.0,
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: (){
              Navigator.pushNamed(context, RegistrationScreen.id);},

            minWidth: 200.0,
            height: 42.0,

            child: Text(
              'Registration',
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
    );
  }
}


