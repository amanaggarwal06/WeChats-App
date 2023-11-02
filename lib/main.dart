import 'package:flutter/material.dart';
import 'package:chats_app/screens/welcome_screen.dart';
import 'package:chats_app/screens/login_screen.dart';
import 'package:chats_app/screens/registration_screen.dart';
import 'package:chats_app/screens/chat_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:chats_app/constants.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  if(kIsWeb){
    //run the initialisation for web
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: kapiKey,
            appId: kappId,
            messagingSenderId: kmessagingSenderId,
            projectId: kprojectId));
  }
  else{
    //initialisations for android
    await Firebase.initializeApp();
  }


  runApp(FlashChat());
  print("aman aggarwal");
}

class FlashChat extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData.dark().copyWith(
      //   textTheme: TextTheme(
      //     bodyMedium: TextStyle(color: Colors.black54),
      //   ),

      home: WelcomeScreen(),
      initialRoute: WelcomeScreen.id,
      routes: {
        LoginScreen.id : (context) => LoginScreen(),
        ChatScreen.id : (context) => ChatScreen(),
        RegistrationScreen.id : (context) => RegistrationScreen(),
        WelcomeScreen.id : (context) => WelcomeScreen(),
      },
    );
  }
}
