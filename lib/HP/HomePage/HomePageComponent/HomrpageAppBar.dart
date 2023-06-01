import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ResetFirebaseData.dart';

class HomepageAppBar extends StatefulWidget {


  @override
  State<HomepageAppBar> createState() => _HomepageAppBarState();
}

class _HomepageAppBarState extends State<HomepageAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.black,
      actions: [
        HomePageFloatingButtion()
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Campousia"),
        ],
      ),
    );
  }
}
