import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lab14/chatscreen.dart';
import 'package:lab14/forgotpassword.dart';


class SignScreen extends StatefulWidget {
  const SignScreen({Key? key}) : super(key: key);
  static String id = 'LoginScreen';

  @override
  _SignScreenState createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  String? Email;
  String? Password;
  String ErrorMsg="";
  final _auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Login to Chat Box"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.all(20),
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                    'assets/images/Chat.png',
                    fit: BoxFit.cover,
                    scale: 1
                ),
                SizedBox(height: 50),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    Email = value;
                  },
                ),
                Padding(padding: EdgeInsets.only(
                  top: 20,
                )),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: 'Enter your password',
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    Password = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),

                Text('$ErrorMsg'),
                SizedBox(
                  height: 10,
                ),

                SizedBox(
                  height: 40,
                  width: 320,
                  child: ElevatedButton(onPressed: () async {

                   final user = await _auth.signInWithEmailAndPassword(email: Email.toString(), password: Password.toString());
                   if(user != null){
                     Navigator.pushNamed(context, ChatScreen.id);
                   }
                   else{
                     setState(() {
                       ErrorMsg = 'Enter correct username and password';
                     });
                   }
                  },
                      child: Text('Login', style: TextStyle(
                        fontSize: 17
                      ),)
                  ),
                ),

                TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, ForgotPassword.id);
                    },
                    child: Text('Forgot Password?', style: TextStyle(
                      fontWeight: FontWeight.w600
                    ),)
                )

              ],
            ),
          ),
        )
    );
  }
}

