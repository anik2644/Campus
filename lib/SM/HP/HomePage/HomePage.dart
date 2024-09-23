
import 'dart:io';


import 'package:dhabiansomachar/SM/Classes/AppStart.dart';
import 'package:dhabiansomachar/SM/Classes/Auth/AuthOffice.dart';
import 'package:dhabiansomachar/SM/Classes/Contents/ContentsOffice.dart';
import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:location/location.dart';
// import '../Model/InternetConnectionCHecker.dart';
// import '../Model/InternetShowDialougeBox.dart';
import '../../Firebase/Auth/FB_Auth_Service.dart';
import '../../ModelClass/Content.dart';
import 'HomePageComponent/HomePageBody.dart';
import 'HomePageComponent/HomePageDrawer.dart';

import 'HomePageComponent/HomrpageAppBar.dart';
import 'package:app_settings/app_settings.dart';
class Homepage extends StatefulWidget {

  HomepageAppBar aPpbar = HomepageAppBar();

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
      body: HomePageBody(),//widget.bOdy,


      floatingActionButton: FloatingActionButton(onPressed: () async {
/*
       List<Content> contents = await ContentsOffice().fetchContentsFromFB();


// Loop through each content and print its fields
        for (Content content in contents) {
          print('Title: ${content.Title}');
          print('Location: ${content.Location}');
          print('All Images List: ${content.AllImagesList}');
          print('Content Image Sequence: ${content.ContentImageSequence}');
          print('Content Segments: ${content.ContentSegments}');
          print('---------------------------');
        }
*/


      },),


    );
  }


}
