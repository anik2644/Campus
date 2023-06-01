import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Firebase Auth Example',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Firebase Auth'),
        ),
        body: Center(
          child: AuthStatus(),
        ),
      ),
    );
  }
}

class AuthStatus extends StatefulWidget {
  @override
  _AuthStatusState createState() => _AuthStatusState();
}

class _AuthStatusState extends State<AuthStatus> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User _currentUser;

  _currentUser = _firebaseAuth.currentUser;
  if (_currentUser != null) {
  return Text('User is logged in');
  } else {
  return Text('User is not logged in');
  }
  @override
  void initState() {
    super.initState();
    _currentUser = _firebaseAuth.currentUser;
  }

  @override
  Widget build(BuildContext context) {
    if (_currentUser != null) {
      return Text('User is logged in');
    } else {
      return Text('User is not logged in');
    }
  }
}
