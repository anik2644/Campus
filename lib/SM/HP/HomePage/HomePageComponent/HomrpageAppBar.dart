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
      leading: IconButton(onPressed: () {
        Scaffold.of(context).openDrawer();
      }, icon:Icon(Icons.menu,
      color: Colors.white,),),
      //automaticallyImplyLeading: true,
      backgroundColor: Colors.black,
      actions: [
       // HomePageFloatingButtion()
      ],
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top:12.0),
            child: Text(
              "ঢাবিয়ান সমাচার",
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
