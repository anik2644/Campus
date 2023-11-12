import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import '../Model/InternetConnectionCHecker.dart';
// import '../Model/InternetShowDialougeBox.dart';
import 'HomePageComponent/HomePageBody.dart';
import 'HomePageComponent/HomePageDrawer.dart';
import 'HomePageComponent/ResetFirebaseData.dart';
import 'HomePageComponent/HomrpageAppBar.dart';
import 'package:app_settings/app_settings.dart';
class Homepage extends StatefulWidget {

  HomepageAppBar aPpbar = HomepageAppBar();
  HomePageFloatingButtion fLoatingButtton = HomePageFloatingButtion();
 // ConnectionChecker bOdy = ConnectionChecker( HomePageBody());

  @override
  State<Homepage> createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {

  bool isloading = true;

  @override
  void initState() {
    //InternetShowDialougeBox.getConnectivity(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      drawer: Mydrawer(),
      appBar: PreferredSize(preferredSize: Size.fromHeight(80), child: widget.aPpbar,),
      body: HomePageBody()//widget.bOdy,

      /*
      floatingActionButton: FloatingActionButton(onPressed: (){
        AppSettings.openAppSettings();


      },),

       */
    );
  }
}
