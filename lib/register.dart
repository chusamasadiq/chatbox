import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'chatscreen.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  static String id= 'ReisterScreen';

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  String? Email;
  String? Password;
  String  ErrorMsg="";
  final _uth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Register to Chat Box"),
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
                  child: ElevatedButton(
                      onPressed: () async {
                  UserCredential user  = await _uth.createUserWithEmailAndPassword(email: Email.toString(), password: Password.toString());
                    if(user != null){
                      Navigator.pushNamed(context, ChatScreen.id);
                    }
                    else{
                      setState(() {
                        ErrorMsg = 'Enter correct username and password';
                      });
                    }
                  },
                      child: Text('Register', style: TextStyle(
                        fontSize: 17
                      ),)
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
