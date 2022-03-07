import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:lab14/chatscreen.dart';
import 'package:lab14/forgotpassword.dart';
import 'package:lab14/homepage.dart';
import 'package:lab14/register.dart';
import 'package:lab14/signin.dart';
import 'package:google_fonts/google_fonts.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: HomePage.id,
      routes: {
        SignScreen.id: (context) => SignScreen(),
        RegisterScreen.id: (context) => RegisterScreen(),
        ChatScreen.id: (context) => ChatScreen(),
        ForgotPassword.id: (context) => ForgotPassword()
      },
      theme:ThemeData(
        primarySwatch: Colors.teal,
            fontFamily: GoogleFonts.lato().fontFamily
      ),
      home: HomePage(),

    );
  }
}




