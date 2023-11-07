
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhabiansomachar/SM/UI/Pages/Feeds.dart';
import 'package:dhabiansomachar/SM/UI/Pages/TabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ionicons/ionicons.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../JSON_Management/JSONFile.dart';
import '../../ModelClass/Post.dart';

import '../Components/FeedComponents/userpost.dart';

import 'package:firebase_auth/firebase_auth.dart';

import '../Pages/Landing.dart';

class HPStretegy extends StatefulWidget {
  @override
  _HPStretegyState createState() => _HPStretegyState();
}


class _HPStretegyState extends State<HPStretegy> with AutomaticKeepAliveClientMixin{

  bool isloggedin = false;
  bool isloading = true;


  @override
  void initState() {
    alreadyLoggedIn();
    setState(() {
      isloading =false;
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading? CircularProgressIndicator():
    isloggedin?
    Landing() ://TabScreen():
    Landing() ;
  }





  Future<bool> alreadyLoggedIn() async {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? _currentUser = await _firebaseAuth.currentUser;

    if (_currentUser != null)  {
      print('yes');
      isloggedin =true;
      return true;
      /*      setState(() {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) =>TabScreen()// Landing(),//SecondaryHomepage()
            ));
      });*/
    }
    else {
      print('no');
      isloggedin =false;
      return false;
      /*      Navigator.push(context,
          MaterialPageRoute(builder: (context) =>Landing()// TabScreen()//  Landing(),//SecondaryHomepage()
          ));*/
    }
  }




  @override
  bool get wantKeepAlive => true;
}
