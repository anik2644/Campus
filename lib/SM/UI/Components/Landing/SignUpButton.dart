import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../Pages/auth/register/register.dart';

class Signup extends StatelessWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   GestureDetector(
      onTap: () {
                  Navigator.of(context).pushReplacement(
                    CupertinoPageRoute(
                      builder: (_) => Register(),
                    ),
                  );
      },
      child: Container(
        height: 45.0,
        width: 130.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.0),
          border: Border.all(color: Colors.white),
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [
              Theme.of(context).colorScheme.secondary,
              Color(0xff597FDB),
            ],
          ),
        ),
        child: Center(
          child: Text(
            'SIGN UP',
            style: TextStyle(
              fontWeight: FontWeight.w900,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
