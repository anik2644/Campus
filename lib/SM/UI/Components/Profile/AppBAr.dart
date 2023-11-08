import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../ModelClass/LoginCredential.dart';

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
