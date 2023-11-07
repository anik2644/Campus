import 'package:dhabiansomachar/SM/Firebase/Auth/FetchCredential.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Auth/Credential.dart';
import 'package:dhabiansomachar/SM/JSON_Management/Auth/LoginFlagJson.dart';
import 'package:dhabiansomachar/SM/ModelClass/Flags.dart';
import 'package:dhabiansomachar/SM/ModelClass/LoginFlag.dart';
import 'package:dhabiansomachar/SM/UI/Components/Landing/Body.dart';
import 'package:dhabiansomachar/SM/UI/Components/Landing/LoginButton.dart';
import 'package:dhabiansomachar/SM/UI/Components/Landing/SignUpButton.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import '../../JSON_Management/JSONFile.dart';
import '../../ModelClass/User.dart';
import '../../Utilites/Constants/firebase.dart';

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
      /* floatingActionButton:

      FloatingActionButton(
        onPressed: () async {


          LoginFlag lf = LoginFlag(false);
          late LoginFlag lg;


          //lf.isloggedin =   !lf.isloggedin;
          // print("ssssobject");
          // print( lf.isloggedin);
          // print("ssssobject");
          LoginFlagJson lfj = LoginFlagJson();
          lfj.saveLoginInfo(lf);
          //Credential sc = Credential();
           //sc.saveCredential(us);
       // User us  = await sc.getLoginInfo();

          lg = await lfj.getLoginInfo();
        print(lg.isloggedin);

        },
      ),

           */
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
