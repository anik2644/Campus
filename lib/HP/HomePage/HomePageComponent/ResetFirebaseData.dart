import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../../../Model/StaticPart/Firebase/FirebaseFetchId.dart';
// import '../../../Model/StaticPart/Firebase/FirebaseUpdate.dart';

class HomePageFloatingButtion extends StatefulWidget {
  const HomePageFloatingButtion({Key? key}) : super(key: key);

  @override
  State<HomePageFloatingButtion> createState() => _HomePageFloatingButtionState();
}

class _HomePageFloatingButtionState extends State<HomePageFloatingButtion> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () async {


        FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
        User? _currentUser;

        _currentUser = _firebaseAuth.currentUser;
        if (_currentUser != null) {
          print('User is logged in');
        } else {
          print('User is not logged in');
        }

        // String docid= await FirebaseFetchId.getScheduleDocID("Taranga") as String;
        // //print(docid);
        // FirebaseUpdate.updateScheduleArray(docid,"locShare");

      },
      child: Icon(Icons.refresh,color: Colors.white,),
      backgroundColor: Colors.black,
    );
  }
}
