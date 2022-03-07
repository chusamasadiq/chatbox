import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'constants.dart';


class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);
  static String id = 'ChatScreen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;
  late final User logedinUser;
  String? message;

  @override
  void initState() {
    super.initState();
    getcurrentUser();
  }

  void getcurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        logedinUser = user;
        print(logedinUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Start Chat Now!'),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              StreamBuilder<QuerySnapshot>(
                stream: _firestore.collection('message').snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                  if(snapshot.hasData){
                    final List<DocumentSnapshot> messages = snapshot.data!.docs;
                    return Expanded(
                        child: ListView(
                          children: messages
                              .map(
                              (doc) => Card(
                                child: ListTile(
                                  title: Text(doc['sender']),
                                  subtitle: Text(doc['text']),
                                ),
                              )

                          ).toList())
                    );
                  }
                  else{
                    return Text('Error');
                  }
                }
              ),
              Container(
                decoration: kMessageContainerDecoration,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        onChanged: (value) {
                          message = value;
                        },
                        decoration: kMessageTextFieldDecoration,
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        _firestore
                            .collection('message')
                            .add({'text': message, 'sender': logedinUser.email});
                      },
                      child: Text(
                        'Send',
                        style: kSendButtonTextStyle,
                      ),
                    ),
                  ],
                ),
              ),

            ],
          ),
        ),
    );
  }
}
