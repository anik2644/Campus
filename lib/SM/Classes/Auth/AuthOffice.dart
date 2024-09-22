import 'dart:convert';
import 'dart:io';
import 'package:dhabiansomachar/SM/Firebase/Auth/FB_Auth_Service.dart';
import 'package:dhabiansomachar/SM/JSON_Management/JSONOFFICE.dart';
import 'package:path_provider/path_provider.dart';

import '../../Firebase/Auth/FetchCredential.dart';
import '../../JSON_Management/Auth/Credential.dart';
import '../../JSON_Management/Auth/LoginFlagJson.dart';
import '../../ModelClass/LoginCredential.dart';
import '../../ModelClass/LoginFlag.dart';
import '../../ModelClass/User.dart';


class AuthOffice {

  Future<bool> alreadyLoggedInn() async {

      JsonOffice jsonOffice = JsonOffice();
      FBAuthService fbAuthService = FBAuthService();
      bool isloggedininfojson= false;

      isloggedininfojson = (await LoginFlagJson().getLoginInfo()).isloggedin;




      bool isloggedininfofb= false;
      if(isloggedininfojson)
      {
         return true;
        //check json credentials
      }
      else{
        isloggedininfofb = fbAuthService.isUserLoggedIn();
        //check firebase login
      }

      if(isloggedininfofb)
      {


        LoginFlagJson().saveLoginInfo( LoginFlag(true));


        Object uk =  await fbAuthService.getLoginCredential();
        User us = uk as User;
        print(us.country);


        LoginCredentials().login(us);
        JSONCredential().saveCredential(us);

        return true;

        // LoginCredentials().login(await Credential().getCredential());
        // update Json flag + credentials
      }
      else{

        return false;
        // move to login signup
    }


    //print("from already login?");
  }


  Future<bool> alreadyLoggedIn() async {
    JsonOffice jsonOffice = JsonOffice();
    FBAuthService fbAuthService = FBAuthService();

    // Check if the user is logged in via JSON
    bool isloggedininfojson = await _checkLoginFromJson();

    if (isloggedininfojson) {
      return true; // User is logged in via JSON
    }

    // Check if the user is logged in via Firebase
    bool isloggedininfofb = await _checkLoginFromFirebase(fbAuthService);

    return isloggedininfofb; // Return Firebase login status
  }

// Private method to check login from JSON
  Future<bool> _checkLoginFromJson() async {
    LoginFlagJson loginFlagJson = LoginFlagJson();
    bool isloggedininfojson = (await loginFlagJson.getLoginInfo()).isloggedin;
    return isloggedininfojson;
  }

// Private method to check login from Firebase
  Future<bool> _checkLoginFromFirebase(FBAuthService fbAuthService) async {
    bool isloggedininfofb = fbAuthService.isUserLoggedIn();

    if (isloggedininfofb) {
      // Update JSON flag and save Firebase login credentials
      LoginFlagJson().saveLoginInfo(LoginFlag(true));

      Object userCredential = await fbAuthService.getLoginCredential();
      User user = userCredential as User;
      print(user.country);

      LoginCredentials().login(user);
      JSONCredential().saveCredential(user);

      return true;  // Return true when the user is logged in
    }

    return false; // Explicitly return false if the user is not logged in
  }






  }
