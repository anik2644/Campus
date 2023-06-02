//import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageDrawerElement/EditPage/ScheduleAndPasswordEdit.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;
// import '../../../../../../../../../Model/StaticPart/BusStaticVariables.dart';
// import '../../../../../../../../../Model/StaticPart/Firebase/FirebaseLocationWrite.dart';
// import '../../../../../../../../../Model/StaticPart/Firebase/FirebaseReadArray.dart';
// import '../../../../../../../../../Model/StaticPart/Firebase/FirebaseUpdate.dart';
// import '../../../../../../../../../Model/StaticPart/ModelStatic.dart';
// import '../../../ParticularHP/ParticulurHomePage.dart';
import 'EditPage/ScheduleAndPasswordEdit.dart';
import 'LoginPopup.dart';

class LoginButton extends StatefulWidget {

  TextEditingController  _usernameController;
  TextEditingController  _passWordController;
  int index;
  LoginButton(this._usernameController,this.index,this._passWordController);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  String latt = "0.00";
  String lonn = "0.00";
  int timeRestartFlag = 1;

/*

  void _updateNotice()
  {

    int flag = 0;
    for (int i = 0;
    i < widget._usernameController.text.length;
    i++) {
      if (widget._usernameController.text.codeUnitAt(i) > 64 &&
          widget._usernameController.text.codeUnitAt(i) < 91 ||
          widget._usernameController.text.codeUnitAt(i) > 96 &&
              widget._usernameController.text.codeUnitAt(i) <
                  123) {
        flag = 1;
        break;
      }
    }
    if (flag == 1) {
      BusStaticVariables.Notice = widget._usernameController.text;
    }

  }
  void _updateLocshareFlag()
  {
    BusStaticVariables.locShare[ ModelStatic.location_share_schedule_index] = "0";
  }


  Future<void> LocationtoBeSharedOrNot() async {


     if(BusStaticVariables.locShare[ModelStatic.location_share_schedule_index]=="1"
         && BusStaticVariables.Password[ModelStatic.location_share_schedule_index]==widget._passWordController.text)
    {


      print("Locstion to be shared");

      ModelStatic.start_time = new DateTime.now();
      //
      // //for enable location on
      // bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      // if (!serviceEnabled) {await Geolocator.getCurrentPosition();}

      _updateNotice();
      _updateLocshareFlag();

      FirebaseUpdate.updateLocshareAndNotice();
      if (ModelStatic.gps_share_flag == 0) {
        ModelStatic.gps_share_flag = 1;
        loc.Location location = new loc.Location();
        location.enableBackgroundMode(enable: true);
        await location.changeSettings(accuracy: loc.LocationAccuracy.high, distanceFilter: 1);
        //
         print("Locstion to be shared7");
        ModelStatic.locationSubscription = location.onLocationChanged.listen(
                (loc.LocationData currentLocation) async {
                  print("Locstion to be shared8");
            //  timeRestartFlag = _timeTrack();
            //  _timeFlagAction(timeRestartFlag);

              FirebaseLocationWrite.locationWrite( currentLocation.latitude!, currentLocation.longitude!);
              _updateAppBar(currentLocation.latitude!.toString(), currentLocation.longitude!.toString());

            });

      }


      setState(() {
        _finalAction();
      });



    }
    else
    {
      if(BusStaticVariables.Password[ModelStatic.location_share_schedule_index]!=widget._passWordController.text)
      {
          ModelStatic.passwordNotMatched=1;
      }
      print(BusStaticVariables.locShare[ModelStatic.location_share_schedule_index]);
      ModelStatic.locSharePopupFlag=0;
      print("Not SHared");
      //Navigator.pop(context);
       LoginPopup popup =LoginPopup(context,widget.index);
       popup.openDialouge(widget.index);

    }
  }


  */
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(

        onPressed: () async {


          if(widget._usernameController.text =="Anik"&& widget._passWordController.text =="11556")
            {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>ScheduleAndPasswordEdit()));
            }
            // ModelStatic.location_share_schedule_index = widget.index;
            // await FirebaseReadArray.loadLocShreFlag();
            // setState(() {
            //   LocationtoBeSharedOrNot();
            // });


          },
          child:  Text("Login"),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
      ),
          /*
          Row(
            children: [
              Text("Share"),
              SizedBox(width: 5),
              Icon( Icons.location_on),
            ],
          )

           */
    );
  }
/*
  void _finalAction()
  {

    //ModelStatic.gps_share_flag = 1;
    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ParticulurHomePage()));
    //  Navigator.pop(context);
   // print("Location Share Done");
  }

  void _updateAppBar(String lat,String lon)
  {
    print(lat);
    print(lon);

    ModelStatic.particularAppbarText = "location: $lat : $lon ";
  }

  int _timeTrack()
  {
    int time_flag = 1;
    DateTime current_time = new DateTime.now();

    if (current_time.year >
        ModelStatic.start_time.year) {
      time_flag = 0;
    } else if (current_time.month >
        ModelStatic.start_time.month) {
      time_flag = 0;
    } else if (current_time.day >
        ModelStatic.start_time.day) {
      time_flag = 0;
    } else if (current_time.hour >
        ModelStatic.start_time.hour + 4) {
      time_flag = 0;
    }

         return time_flag;
  }

  void _timeFlagAction(int timeFlag)
  {
    if (timeFlag == 0) {
      loc.Location.instance
          .enableBackgroundMode(enable: false);
      ModelStatic.locationSubscription
          .cancel();

      ModelStatic.gps_share_flag = 0;
      print("app will restart");
      timeRestartFlag = 1;
    }
  }
*/
}
