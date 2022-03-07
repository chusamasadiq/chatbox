import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lab14/register.dart';
import 'package:lab14/signin.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static String id = 'HomePage';
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Welcome to Chat Box'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
            child: Column(

              children: [
                SizedBox(
                  height: 100,
                ),
                Image.asset(
                    'assets/images/Chat.png',
                    fit: BoxFit.cover,
                    scale: 2.5
                ),
                SizedBox(height: 50),
                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, SignScreen.id);
                  },
                      child: Text('Login', textScaleFactor: 1.5,)
                  ),
                ),

                  SizedBox(height: 50),

                SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(onPressed: (){
                    Navigator.pushNamed(context, RegisterScreen.id);
                  },
                      child: Text('Register', textScaleFactor: 1.5,)
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                Text('Powered By Ch Usama', style: TextStyle(
                  color: Colors.teal,

                ),)
              ]
            ),
          ),
      ),

    );
  }
}
