import 'package:dhabiansomachar/SM/HP/HomePage/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../../ModelClass/LoginCredential.dart';
import '../../../ModelClass/LoginFlag.dart';
import '../../../Utilites/Constants/firebase.dart';
import '../../Helper/HPStrategy.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: Text(
        "ঢাবিয়ান সমাচার",//"Press me to enter",
        style: TextStyle(fontSize: 30,color: Colors.black, fontFamily: 'Alkatra',),
      ),
      actions: [
        LoginCredentials().isLoggedIn()
            ? Center(
          child: Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: GestureDetector(
              onTap: () async {

                await firebaseAuth.signOut();

                LoginFlag lf = LoginFlag(false);
                LoginFlagJson lfj = LoginFlagJson();
                await lfj.saveLoginInfo(lf);
                print(lf.isloggedin);

                LoginCredentials().logout();

                Navigator.pushAndRemoveUntil(
                  context,
                  CupertinoPageRoute(
                    builder: (_) =>  Homepage(),// HPStretegy(), //Landing(),
                  ),
                      (route) => false, // This makes sure that the user can't go back to the previous screen
                );




                // await firebaseAuth.signOut();
/*                  Navigator.of(context).push(
                    CupertinoPageRoute(
                      builder: (_) => Homepage(),
                    ),
                  );*/
              },
              child: Text(
                'Log Out',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        )
            : SizedBox()
      ],
    );
  }
}
