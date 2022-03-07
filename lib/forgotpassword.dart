import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
   ForgotPassword({Key? key}) : super(key: key);
  static String id = 'ForgotPassword';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String? Email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Forgot Password"),
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
              SizedBox(height: 20),
              SizedBox(
                height: 40,
                width: 320,
                child: ElevatedButton(
                  onPressed: ()  {

                  },
                    child: Text('Find your account', style: TextStyle(
                        fontSize: 17

                    ),
                )
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}
