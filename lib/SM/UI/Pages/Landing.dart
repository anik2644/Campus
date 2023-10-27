import 'package:dhabiansomachar/SM/UI/Components/Landing/Body.dart';
import 'package:dhabiansomachar/SM/UI/Components/Landing/LoginButton.dart';
import 'package:dhabiansomachar/SM/UI/Components/Landing/SignUpButton.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:social_media_app/auth/login/login.dart';

class Landing extends StatefulWidget {
  @override
  _LandingState createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Body(),//image space
      bottomNavigationBar: BottomAppBar(
        color: Colors.black,
        elevation: 0.0,
        child: Padding(
          padding: const EdgeInsets.only(left: 20.0, right: 20.0, bottom: 20.0,top: 10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Signup(),
             LoginButton(),
            ],
          ),
        ),
      ),

    );
  }
}
