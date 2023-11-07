import 'package:dhabiansomachar/SM/ModelClass/User.dart';
import 'package:dhabiansomachar/SM/UI/Pages/TabScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../../JSON_Management/Auth/Credential.dart';
import '../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../ModelClass/LoginCredential.dart';
import '../../ModelClass/LoginFlag.dart';
import '../Pages/Landing.dart';

class HPStretegy extends StatefulWidget {
  @override
  _HPStretegyState createState() => _HPStretegyState();
}


class _HPStretegyState extends State<HPStretegy> with AutomaticKeepAliveClientMixin{

  bool isloggedin = false;
  bool isloading = true;


  @override
  void initState() {
    alreadyLoggedIn();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return isloading? CircularProgressIndicator():
    isloggedin?
    TabScreen(): //Landing() ://
    Landing() ;
  }





  Future<void> alreadyLoggedIn() async {

    isloggedin = (await LoginFlagJson().getLoginInfo()).isloggedin;
    setState(() => isloading = false);

    if(isloggedin) {
      LoginCredentials().login(await Credential().getCredential());
    }

  }


  @override
  bool get wantKeepAlive => true;
}
