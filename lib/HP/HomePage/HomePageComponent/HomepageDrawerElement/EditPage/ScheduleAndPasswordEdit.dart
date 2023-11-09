// import 'package:campousia/Model/StaticPart/Firebase/FirebaseReadArray.dart';
// import 'package:campousia/Screen/HomePage/HomePage.dart';
// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/EditPage/3Items_Change/DownTripsChange.dart';
// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/EditPage/3Items_Change/PasswordChange.dart';
// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/EditPage/3Items_Change/UptripsChange.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../HomePage.dart';
//
// import '../../../../../Model/StaticPart/FirabaseStaticVariables.dart';
// import '../../../../../Model/StaticPart/ModelStatic.dart';
// import '../../../../Model/LoadIndicator.dart';

class ScheduleAndPasswordEdit extends StatefulWidget {

  @override
  State<ScheduleAndPasswordEdit> createState() => _ScheduleAndPasswordEditState();
}

class _ScheduleAndPasswordEditState extends State<ScheduleAndPasswordEdit> {

/*
  Future<void> GotoSelectedPage(var Page) async {

    FirebaseStaticVAriables.isLoading= false ;
    if(!FirebaseStaticVAriables.isLoading)
    {
      LoadingIndicator oPenDialouge = new LoadingIndicator(context);
      oPenDialouge.openDialouge();
    }
    await ModelStatic.particularBusDataLoad();
    await FirebaseReadArray.loadLocShreFlag();

    setState(() {
      if(FirebaseStaticVAriables.isLoading)
      {
        FirebaseStaticVAriables.isLoading=!FirebaseStaticVAriables.isLoading;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => Page));
      }
    });


  }

*/


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> Homepage()));
        return true;
      },
      child: Scaffold(
        appBar: AppBar(title: Text("Choose Edit option"),),
        body: Center(
          child: Column(
   children: [
           ElevatedButton(onPressed: (){
          //   GotoSelectedPage(UptripChange());
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> UptripChange()));
           }, child: Text("Edit Uptrips")),

           SizedBox(height: 25,),

           ElevatedButton(onPressed: (){
         //    GotoSelectedPage(DownTripChange());
           //  Navigator.push(context, MaterialPageRoute(builder: (context)=> DownTripChange()));
           }, child: Text("Edit Downtrips")),

           SizedBox(height: 25,),

           ElevatedButton(onPressed: (){
            // GotoSelectedPage(PasswordChange());
            // Navigator.push(context, MaterialPageRoute(builder: (context)=> PasswordChange()));
           }, child: Text("Edit Password")),

           SizedBox(height: 25,),
   ],
          ),
        ),
      ),
    );
  }
}
