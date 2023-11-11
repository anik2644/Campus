// import 'package:campousia/Screen/HomePage/HomePageComponent/HomepageBodyComponant/StartButtonComponents/StartButtonBody.dart';
// import 'package:campousia/Screen/SecondaryHomePage/SecondaryHomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../UI/Helper/HPStrategy.dart';
import 'StartButtonBody.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import '../../../../../Model/StaticPart/FirabaseStaticVariables.dart';
// import '../../../../../Model/StaticPart/ModelStatic.dart';
// import '../../../../Model/LoadIndicator.dart';


class StartButtonBuilder extends StatefulWidget {

  StartButtonBody bOdy = StartButtonBody();

  @override
  State<StartButtonBuilder> createState() => _StartButtonBuilderState();
}

class _StartButtonBuilderState extends State<StartButtonBuilder> {
/*

  Future<void> StartButtonOnPressed() async {

      FirebaseStaticVAriables.isLoading= false ;
      if(!FirebaseStaticVAriables.isLoading)
      {
        LoadingIndicator oPenDialouge = new LoadingIndicator(context);
        oPenDialouge.openDialouge();
      }
      await ModelStatic.particularBusDataLoad();

      setState(() {
        if(FirebaseStaticVAriables.isLoading)
        {
          FirebaseStaticVAriables.isLoading=!FirebaseStaticVAriables.isLoading;
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => SecondaryHomepage()));
         }
      });


    }
*/


  void StartButtonOnPressed() {



    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
    User? _currentUser;

    _currentUser = _firebaseAuth.currentUser;
    // if (_currentUser != null) {
    //   return Text('User is logged in');
    // } else {
    //   return Text('User is not logged in');
    // }
    //
    //


        if (_currentUser != null)  {


          print('yes');

          //UserModel.UserRefresh();

          setState(() {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>HPStretegy()// Landing(),//SecondaryHomepage()
                ));
          });

        } else
          {
            print('no');
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>HPStretegy()// TabScreen()//  Landing(),//SecondaryHomepage()
                ));
          }

    // User? _currentUser;
    // FirebaseAuth.instance.authStateChanges().listen((User? user) {
    //   setState(() {
    //     _currentUser = user;
    //   });
    // });
    //
    //     if( firebaseAuth.currentUser!.uid == null)  {
    //       print('yes');
    //       Navigator.pushReplacement(context,
    //           MaterialPageRoute(builder: (context) => Landing()//TabScreen()// Landing(),//SecondaryHomepage()
    //           ));
    //     } else
    //       {
    //         print('no');
    //         Navigator.pushReplacement(context,
    //             MaterialPageRoute(builder: (context) => TabScreen()//  Landing(),//SecondaryHomepage()
    //             ));
    //       }
          //return Landing();

    // StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder: ((BuildContext context, snapshot) {
    //    // return Homepage();
    //     if (snapshot.hasData) {
    //       return TabScreen();
    //     } else
    //       return Landing();
    //   }),
    // );

  }


  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: StartButtonOnPressed,
      child: widget.bOdy,
    );
  }


}
